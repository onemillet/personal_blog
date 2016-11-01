from django.shortcuts import render,redirect
#引用logging模块，可以实例化出一个logging的对象
import logging
from .models import *
from .forms import *

#实例化一个“日志器”——以blog.views做“配置参考”（这个“配置参考就在settings.py中的LOGGING参数最后一项）
logger = logging.getLogger('blog.views')

#引用settings中的配置（包括公用的变量）
from django.conf import settings

#引入分页类及相关的异常类型
from django.core.paginator import Paginator,InvalidPage,EmptyPage,PageNotAnInteger

#使用原生的sql语句需引入的模块
from django.db import connection

#引入Count函数
from django.db.models import Count

#登录，注销，判断是否登录等需要使用到的模块
from django.contrib.auth import logout, login, authenticate
#密码在后台存储时，采用的是加密后的存储方式，和linux储存用户密码的方式类似。所以要用到make_password方法
from django.contrib.auth.hashers import make_password

#定义一个函数来返回settings中配置的变量：（也可以直接在视图函数中使用settings中的变量）
#再在settings.py的上下文处理器（'context_processors'）中添加这个函数
#在模板中就可以直接使用函数中定义的变量名了。
def global_settings(request):
    #这部分是公有的代码
    # 导航栏
    category_list = Category.objects.all()
    # 广告栏
    ad_list = Ad.objects.all()
    # 文章归档
    archive_list = Article.objects.distinct_date()
    #标签云数据
    tag_list = Tag.objects.all()
    #友情链接（links）
    link_list=Links.objects.all()
    #浏览排行榜
    article_click_count = Article.objects.all().order_by('-click_count')

    #评论排行，需要使用聚合函数annotate，引入Count函数
    comment_count_list=Comment.objects.values('article').annotate(comment_count=Count('article')).order_by('-comment_count')
    #print(comment_count_list)
    article_comment_list=[]
    for comment in comment_count_list:#pk表示主键
        article = Article.objects.get(pk=comment['article'])
        article_comment_list.append(article)

    #站长推荐
    article_is_recommend=Article.objects.filter(is_recommend=True).order_by('-id')

    return {
        'SITE_NAME':settings.SITE_NAME,
        'SITE_DESC':settings.SITE_DESC,
        'SITE_URL':settings.SITE_URL,
        'category_list': category_list,
        'ad_list': ad_list,
        'archive_list': archive_list,
        'article_comment_list':article_comment_list,
        'article_click_count':article_click_count,
        'article_is_recommend':article_is_recommend,
        'tag_list':tag_list,
        'link_list':link_list,
    }
    #也可以这样写：
    #return locals()

# Create your views here.
def index(request):
    try:
        article_list = Article.objects.all()
        article_list=getPagination(request,article_list)

    except Exception as e:
        logger.error(e)

    return render(request, 'index.html',locals())

def archive(request):
    try:
        #获取用户的请求信息
        year=request.GET.get('year')
        month=request.GET.get('month')
        #模糊查询
        article_list=Article.objects.filter(date_publish__icontains=year+'-'+month)
        #分页：
        article_list=getPagination(request,article_list)

    except Exception as e:
        logger.error(e)
    return render(request, 'archive.html', locals())

#分页函数：
def getPagination(request,content):
    paginator = Paginator(content, 2)
    try:
        #从request中取出'page'参数，作为返回的页面，如果没有‘page’参数，默认返回第一页
        page = int(request.GET.get('page', 1))
        content = paginator.page(page)
    except (PageNotAnInteger, EmptyPage, InvalidPage):
        content = paginator.page(1)  # 显示第一页
    return content

#文章详情
def article(request):
    try:
        #获取文章id
        id = request.GET.get('id')
        try:
            #获取文章信息
            article=Article.objects.get(pk=id)
        except Article.DoesNotExist:
            return render(request,'failure.html',{'reason':'没有找到对应的文章'})
    except EmptyPage as e:
        logger.log(e)

    #文章每被点击一次，就等于被浏览了一次，此时article的click_count要加1
    # click_count=Article.objects.filter(id=id).values('click_count',)#取出的结果是一个list,里面存放的元素都是键值对
    # click_count=click_count[0]['click_count']
    # print(click_count)
    article.click_count += 1
    article.save()

    #评论表单
    comment_form = CommentForm({'author': request.user.username,
                                'email': request.user.email,
                                'url': request.user.url,
                                'article': id} if request.user.is_authenticated() else{'article': id})
    #获取评论信息
    comments = Comment.objects.filter(article=article).order_by('id')
    #comment_list是存放父评论的
    comment_list = []
    #因为查询出来的结果是按照id降序排列的，所以遍历时，父评论一定是在子评论之前出现的
    for comment in comments:
        #一些未登录用户，None类型，没有avatar属性，会报错，所以要判断一下
        if comment.user:
            avatar_url=str(comment.user.avatar)
            # print(avatar_url)
            # print(comment.user.avatar)
            # print(comment)#输出的是comment的id
            # print(type(comment.user.avatar))
            # print(type(comment))
            # print(type(avatar_url))

            #用setattr方法为comment增加avatar_url
            setattr(comment,'avatar_url',avatar_url)

        for item in comment_list:
            if not hasattr(item, 'children_comment'):
                setattr(item, 'children_comment', [])
            if comment.pid == item:
                item.children_comment.append(comment)
                break
        if comment.pid is None:
            comment_list.append(comment)
    #统计评论次数（只统计父评论的，子评论的未计入）
    comment_count=len(comment_list)
    return render(request,'article.html',locals())

#提交评论
def comment_post(request):
    try:
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            #获取表单信息
            comment = Comment.objects.create(username=comment_form.cleaned_data["author"],
                                             email=comment_form.cleaned_data["email"],
                                             url=comment_form.cleaned_data["url"],
                                             content=comment_form.cleaned_data["comment"],
                                             article_id=comment_form.cleaned_data["article"],
                                             user=request.user if request.user.is_authenticated() else None)#is_authenticated()方法判断用户是否已经登录
            comment.save()
        else:
            return render(request, 'failure.html', {'reason': comment_form.errors})
    except Exception as e:
        logger.error(e)
    return redirect(request.META['HTTP_REFERER'])

# 注销
def do_logout(request):
    try:
        logout(request)
    except Exception as e:
        print(e)
        logger.error(e)
    return redirect(request.META['HTTP_REFERER'])

# 注册
def do_reg(request):
    try:
        if request.method == 'POST':
            reg_form = RegForm(request.POST)
            if reg_form.is_valid():
                # 注册
                user = User.objects.create(username=reg_form.cleaned_data["username"],
                                    email=reg_form.cleaned_data["email"],
                                    url=reg_form.cleaned_data["url"],
                                    password=make_password(reg_form.cleaned_data["password"]),)
                user.save()

                # 登录
                user.backend = 'django.contrib.auth.backends.ModelBackend' # 指定默认的登录验证方式
                login(request, user)
                return redirect(request.POST.get('source_url'))
            else:
                return render(request, 'failure.html', {'reason': reg_form.errors})
        else:
            reg_form = RegForm()
    except Exception as e:
        logger.error(e)
    return render(request, 'reg.html', locals())

# 登录
def do_login(request):
    try:
        if request.method == 'POST':
            login_form = LoginForm(request.POST)
            if login_form.is_valid():
                # 登录
                username = login_form.cleaned_data["username"]
                password = login_form.cleaned_data["password"]
                print(username,password)
                user = authenticate(username=username, password=password)
                if user is not None:
                    user.backend = 'django.contrib.auth.backends.ModelBackend' # 指定默认的登录验证方式
                    login(request, user)
                else:
                    return render(request, 'failure.html', {'reason': '登录验证失败'})
                return redirect(request.POST.get('source_url'))
            else:
                return render(request, 'failure.html', {'reason': login_form.errors})
        else:
            login_form = LoginForm()
    except Exception as e:
        logger.error(e)
    return render(request, 'login.html', locals())

#处理文章归档（导航栏显示）
def category(request):
    try:
        # 先获取客户端提交的信息
        cid = request.GET.get('cid', None)
        try:
            category = Category.objects.get(pk=cid)
        except Category.DoesNotExist:
            return render(request, 'failure.html', {'reason': '分类不存在'})
        article_list = Article.objects.filter(category=category)
        article_list = getPagination(request, article_list)
    except Exception as e:
        logger.error(e)
    return render(request, 'category.html', locals())

#处理标签云（点击标签云后会调用此函数）
def tag(request):
    try:
        #从用户的request中获取tag的id
        tid = request.GET.get('tid',None)
        try:
            tag = Tag.objects.get(pk=tid)
        except Tag.DoesNotExist:
            return render(request,'failure.html',{'reason':'该标签不存在'})
        article_list = Article.objects.filter(tag=tag)
        article_list = getPagination(request, article_list)
    except Exception as e:
        logger.error(e)
    return render(request, 'tag.html', locals())