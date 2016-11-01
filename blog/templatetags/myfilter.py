from django import template

register = template.Library()

#@register.filter(name='abc')
def month_to_upper(var):
    return ['一','二','三','四','五','六','七','八','九','十','十一','十二'][var.month-1]

register.filter(name='month_to_upper',filter_func=month_to_upper)