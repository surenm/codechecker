from django.conf.urls.defaults import *

urlpatterns = patterns('codechecker.contests.views',
        (r'^$', 'submissions_view_handle'),
        (r'^(?P<page>\d+)/$', 'submissions_view_handle'),
        (r'^contests/(?P<contest_id>\d+)/$', 'submissions_view_handle'),
        (r'^contests/(?P<contest_id>\d+)/(?P<page>\d+)/$', 'submissions_view_handle'),
        (r'^problems/(?P<problem_id>\d+)/$', 'submissions_view_handle'),
        (r'^problems/(?P<problem_id>\d+)/(?P<page>\d+)/$', 'submissions_view_handle'),
        )
