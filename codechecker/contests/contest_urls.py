from django.conf.urls.defaults import *

urlpatterns = patterns('codechecker.contests.views',
        (r'^$', 'contests_default'),
        (r'^all/', 'show_all_contests'),
        (r'^all/(?P<page>\d+)/$', 'show_all_contests'),
        (r'^(?P<contest_id>\d+)/$', 'contest_view_handle'),
        (r'^(?P<contest_id>\d+)/(?P<action>\w+)/$', 'contest_view_handle'),
        (r'^(?P<contest_id>\d+)/(?P<action>\w+)/(?P<page>\d+)/$', 'contest_view_handle'),
        )
