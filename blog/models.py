from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
# 用户模型.
#采用继承方式扩展用户信息
class User(AbstractUser):
    #upload_to是相对于settings.py中设置的MEDIA_ROOT这个路径的
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default='avatar/default.png', max_length=200, blank=True, null=True, verbose_name='用户头像')
    qq = models.CharField(max_length=20, blank=True, null=True, verbose_name='QQ号码')
    mobile = models.CharField(max_length=11, blank=True, null=True, unique=True, verbose_name='手机号码')
    url = models.URLField(max_length=100,blank=True,null=True,verbose_name='个人网页地址')

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = verbose_name
        #设置的排序规则，按照id降序排列
        ordering = ['-id']

    def __str__(self):
        return self.username


#tag（标签）
class Tag(models.Model):
    name=models.CharField(max_length=30,verbose_name='标签名称')

    #备注，在admin后台可以显示自定义的中文名称（__str__()函数）
    class Meta:
        verbose_name='标签'
        verbose_name_plural=verbose_name

    #在admin中显示name
    #def __unicode__(self):
    def __str__(self):#python2.7+django1.8使用__unicode__,python3.5+django1.9使用__str__
        return self.name

#index（标签排序）
class Category(models.Model):
    name = models.CharField(max_length=30, verbose_name='分类名称')
    index=models.IntegerField(default=999,verbose_name='分类排序')

    class Meta:
        verbose_name = '分类'
        verbose_name_plural = verbose_name
        ordering=['index','-id']

    def __str__(self):
        return self.name

#自定义一个文章模型的管理器
#方法一：新加一个查询方法
class ArticleManager(models.Manager):
    def distinct_date(self):
        distinct_date_list=[]
        date_list = self.values('date_publish')
        #print(date_list)
        for date in date_list:
            # print(type(date))
            # date = date['date_publish']
            # print(type(date))
            # print(date.strftime('%Y/%m'))
            date=date['date_publish']
            date=date.strftime('%Y/%m')
            date += u'文章存档'
            if date not in distinct_date_list:
                distinct_date_list.append(date)
        return distinct_date_list

#方法二：改写原有的queryset

# 文章模型
class Article(models.Model):
    title = models.CharField(max_length=50, verbose_name='文章标题')
    desc = models.CharField(max_length=50, verbose_name='文章描述')
    content = models.TextField(verbose_name='文章内容')
    click_count = models.IntegerField(default=0, verbose_name='点击次数')
    is_recommend = models.BooleanField(default=False, verbose_name='是否推荐')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    user = models.ForeignKey(User, verbose_name='用户')
    category = models.ForeignKey(Category, blank=True, null=True, verbose_name='分类')
    #多对多的关系，会生成一张“关系表”
    tag = models.ManyToManyField(Tag, verbose_name='标签')

    class Meta:
        verbose_name = '文章'
        verbose_name_plural = verbose_name
        ordering = ['-date_publish']

    def __str__(self):
        return self.title

    #在Article类中绑定（关联）自己定义的ArticleManager：
    objects=ArticleManager()

# 评论模型
class Comment(models.Model):
    content = models.TextField(verbose_name='评论内容')
    username=models.CharField(max_length=30,blank=True,null=True,verbose_name='用户名')
    email=models.EmailField(max_length=50,blank=True,null=True,verbose_name='邮箱地址')
    url=models.URLField(max_length=100,blank=True,null=True,verbose_name='个人网页地址')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    user = models.ForeignKey(User, blank=True, null=True, verbose_name='用户')
    article = models.ForeignKey(Article, blank=True, null=True, verbose_name='文章')
    pid = models.ForeignKey('self', blank=True, null=True, verbose_name='父级评论')

    class Meta:
        verbose_name = '评论'
        verbose_name_plural = verbose_name
        ordering = ['-date_publish']

    def __str__(self):
        return str(self.id)

# 友情链接
class Links(models.Model):
    title = models.CharField(max_length=50, verbose_name='标题')
    description = models.CharField(max_length=200, verbose_name='友情链接描述')
    callback_url = models.URLField(verbose_name='url地址')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    index = models.IntegerField(default=999, verbose_name='排列顺序(从小到大)')

    class Meta:
        verbose_name = '友情链接'
        verbose_name_plural = verbose_name
        ordering = ['index', 'id']

    def __str__(self):
        return self.title

# 广告
class Ad(models.Model):
    title = models.CharField(max_length=50, verbose_name='广告标题')
    description = models.CharField(max_length=200,  verbose_name='广告描述')
    image_url = models.ImageField(upload_to='ad/%Y/%m', verbose_name='图片路径')
    callback_url = models.URLField(null=True, blank=True, verbose_name='回调url')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    index = models.IntegerField(default=999, verbose_name='排列顺序(从小到大)')

    class Meta:
        verbose_name = u'广告'
        verbose_name_plural = verbose_name
        ordering = ['index', 'id']

    def __str__(self):
        return self.title