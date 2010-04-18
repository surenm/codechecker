from codechecker.contests.models import *
from django.contrib import admin

class ContestAdmin(admin.ModelAdmin):
    list_display = ( 'title' , 'startDateTime', 'endDateTime' )
    search_fields = ['title']

class TeamAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ['name',]

class ProblemAdmin(admin.ModelAdmin):
    list_display = ( 'problemCode', 'contest') 
    search_fields = ['problemCode', 'contest']

class SubmissionAdmin(admin.ModelAdmin):
    list_display = ( 'pk', 'user', 'problem', 'result', 'submissionPoints', ) 
    search_fields = [ 'pk', 'user', 'problem', 'result', ] 

class TempRegAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name', 'primary_email')
    search_fields = ['name']

admin.site.register(Contest, ContestAdmin)
admin.site.register(Team, TeamAdmin)
admin.site.register(Problem, ProblemAdmin)
admin.site.register(TestCase)
admin.site.register(Submission, SubmissionAdmin)
admin.site.register(TempReg, TempRegAdmin)
