from django.contrib import admin
from .models import *

# Register your models here.
#自定义admin
class ArticleAdmin(admin.ModelAdmin):
    #执行add操作时，哪些字段是显示出来让用户操作的
    #fields = ('title','content','desc',)
    #与fields相反的是exclude
    #exclude = ('title','content','desc',)

    #展示已有的数据时，这些数据的哪些字段是显示出来的
    list_display = ('title','content',)
    list_display_links = ('title','content',)

#引入富文本编辑器kindeditor
    class Media:
        js = (
            '/static/js/kindeditor-4.1.10/kindeditor-min.js',
            '/static/js/kindeditor-4.1.10/lang/zh_CN.js',
            '/static/js/kindeditor-4.1.10/config.js',
        )

admin.site.register(User)
admin.site.register(Tag)
admin.site.register(Category)
admin.site.register(Article,ArticleAdmin)
admin.site.register(Comment)
admin.site.register(Ad)
admin.site.register(Links)
