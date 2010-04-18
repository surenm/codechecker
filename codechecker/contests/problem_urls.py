from django.conf.urls.defaults import *

urlpatterns = patterns('codechecker.contests.views',
        (r'^$', 'problems_default'),
        (r'^all/', 'show_all_problems'),
        (r'^all/(?P<page>\d+)/$', 'show_all_problems'),
        (r'^(?P<problem_id>\d+)/$', 'problem_view_handle'),
        (r'^(?P<problem_id>\d+)/submit/$', 'problem_submit'),
        (r'^(?P<problem_id>\d+)/(?P<action>\w+)/$', 'problem_view_handle'),
        (r'^(?P<problem_id>\d+)/(?P<action>\w+)/(?P<page>\d+)/$', 'problem_view_handle'),
        )
