import django
from django.conf.urls.defaults import *
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^codechecker/', include('codechecker.foo.urls')),

    # Uncomment the admin/doc line below and add 'django.contrib.admindocs' 
    # to INSTALLED_APPS to enable admin documentation:
    (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),

    # default Generic Views
    (r'^$', 'codechecker.generic_views.default'),
    (r'^about/$', 'codechecker.generic_views.default', { 'action' : 'about'}),
    (r'^references/$', 'codechecker.generic_views.default', { 'action' : 'references'}),
    (r'^register/$', 'codechecker.generic_views.register'),
    (r'^activate/(?P<code>\d+)/$', 'codechecker.generic_views.activate'),
    (r'^change_password_first_time/$', 'codechecker.generic_views.change_password'),

    # User Related Views
    (r'^login/$', 'django.contrib.auth.views.login', { 'template_name' : 'accounts/login.html', }),
    (r'^logout/$', 'django.contrib.auth.views.logout', { 'next_page' : '/site/', }), 
    (r'^change_password/$', 'django.contrib.auth.views.password_change', { 'template_name' : 'accounts/password_change_form.html' }),
    (r'^password_changed/$', 'django.contrib.auth.views.password_change_done', {'template_name': 'accounts/password_change_done.html'}),
    
    #Contest Related Views
    (r'^contests/', include('codechecker.contests.contest_urls')),

    # Problem Related Views
    (r'^problems/', include('codechecker.contests.problem_urls')),

    # Submission related Views
    (r'^submissions/', include('codechecker.contests.submission_urls')),
    (r'^my_submissions/', include('codechecker.contests.submission_urls')),
)
