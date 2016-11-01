# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-10-11 06:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='category',
            options={'ordering': ['index', '-id'], 'verbose_name': '分类', 'verbose_name_plural': '分类'},
        ),
        migrations.AddField(
            model_name='comment',
            name='email',
            field=models.EmailField(blank=True, max_length=50, null=True, verbose_name='邮箱地址'),
        ),
        migrations.AddField(
            model_name='comment',
            name='url',
            field=models.URLField(blank=True, max_length=100, null=True, verbose_name='个人网页地址'),
        ),
        migrations.AddField(
            model_name='comment',
            name='username',
            field=models.CharField(blank=True, max_length=30, null=True, verbose_name='用户名'),
        ),
        migrations.AddField(
            model_name='user',
            name='url',
            field=models.URLField(blank=True, max_length=100, null=True, verbose_name='个人网页地址'),
        ),
    ]