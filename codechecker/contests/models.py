from django.contrib import admin
from django.db import models
from django.contrib.auth.models import User
from django import forms

import datetime


LANG_TYPES = (
    ('c','C'),
    ('cpp','C++'),
    #(3,'JAVA'),
)

RESULT_TYPES = (
    ('QU', 'QUEUED'),
    ('CMP', 'COMPILING'),
    ('CMPE', 'COMPILATION FAILURE'),
    ('RUN', 'RUNNING'),
    ('ACC', 'ACCEPTED'),
    ('WA', 'WRONG ANSWER'),
    ('TLE', 'TIME LIMIT EXCEEDED'),
    ('OUTE', 'OUTPUT LIMIT EXCEEDED'),
    ('SEG', 'SEGMENTATION FAULT'),
    ('FPE', 'FLOATING POINT ERROR'),
    ('KILL', 'KILLED'),    
    ('ABRT', 'ABORT SIGNALLED'),    
    ('UNKN', ''),
    ('WTF', ''),
)

RUNS_PATH = '/opt/checker/codechecker/backend/submissions/'

class Contest(models.Model):
    title = models.CharField(max_length = 25)
    description = models.TextField()
    startDateTime = models.DateTimeField()
    endDateTime = models.DateTimeField()

    def __unicode__(self):
        return self.title
    
    
class Team(models.Model):
    user = models.ForeignKey(User) 
    name = models.CharField(max_length=25)
    teamSize = models.IntegerField()
    primary_email = models.EmailField(max_length=75)
    secondary_email = models.EmailField(max_length=75, blank=True)
    tertiary_email = models.EmailField(max_length=75, blank=True)
    primary = models.CharField(max_length=25)
    secondary = models.CharField(max_length=25, blank=True)
    tertiary = models.CharField(max_length=25, blank=True)

    def __unicode__(self):
        return self.name

class TempReg(models.Model):
    name = models.CharField(max_length=25, verbose_name = " Your team Name")
    teamSize = models.IntegerField()
    primary_email = models.EmailField(max_length=75, verbose_name="First Participant Email")
    primary = models.CharField(max_length=25, verbose_name="First Participant Name")
    secondary_email = models.EmailField(max_length=75, blank=True, verbose_name="Second Participant Email")
    secondary = models.CharField(max_length=25, blank=True, verbose_name="Second participant Name")
    tertiary_email = models.EmailField(max_length=75, blank=True, verbose_name="Third Participant email")
    tertiary = models.CharField(max_length=25, blank=True, verbose_name="Third Participant Name")
    code = models.CharField(max_length=100, blank=True, null=True, editable=False, default='hash123') 

    def __unicode__(self):
        return self.name + str(self.primary_email)

class Problem(models.Model):
    contest = models.ForeignKey(Contest)
    problemCode = models.CharField(max_length = 25)
    problemStatement = models.TextField()
    problemNotes = models.TextField()
    inputData= models.TextField()
    outputData= models.TextField()
    tlimit = models.IntegerField()
    mlimit = models.IntegerField()
    maxScore = models.IntegerField()
    allowableLanguages = models.CommaSeparatedIntegerField(max_length=10)
        
    def __unicode__(self):
        return self.problemCode
        

class Submission(models.Model):
    user = models.ForeignKey(User)
    problem = models.ForeignKey(Problem)
    result = models.CharField(max_length=4, choices=RESULT_TYPES, default="QU")
    submissionTime = models.DateTimeField(default=datetime.datetime.now())
    submissionLang = models.CharField(max_length=10, choices=LANG_TYPES)
    submissionPenalty = models.IntegerField(default=0)
    submissionPoints = models.IntegerField(default=0)
    submissionCode = models.TextField()    
    
    def __unicode__(self):
        return repr(self.pk)   

    # The prefix underscore implies that the function is not an
    # exported interface (i think).
    def _generate_compile_command(self):
        s = str('')
        file_root = RUNS_PATH + str(self.pk) 

        if self.get_submissionLang_display() == 'C++':
            s = ('g++ -O2 -Wall -o ' + str(file_root)  + '.exe ' + 
                 str(str(file_root) + '.' + self._get_filename_extension()))

        elif self.get_submissionLang_display() == 'C':
            s = ('gcc -O2 -Wall -lm -o ' + str(file_root)  + '.exe ' + 
                 str(str(file_root) + '.' + self._get_filename_extension()))

        elif self.get_submissionLang_display() == 'JAVA':
            s = 'do nothing for now '

        else:
            s = 'oh no'            

        return s

    def _get_filename_extension(self):
        if self.get_submissionLang_display() == 'C++':
            return "cpp"
        elif self.get_submissionLang_display() == 'C':
            return "c"
        elif self.get_submissionLang_display() == 'JAVA':
            return "java"
        else:
            return "c"

    def write_code_to_disk(self):
        f = open(RUNS_PATH + str(self.pk) + '.' + self._get_filename_extension(),'w')
        f.write(self.submissionCode)
        f.close()

    def compile(self):
        import subprocess
        cmd = self._generate_compile_command()
        self.result = 'CMP'
        self.save()
        compile = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        compile_out = compile.communicate()
        print "COMPILER STDOUT: ", compile_out[0]
        print "COMPILER STDERR: ", compile_out[1]
        return compile_out[1]
        
    def check_compile_result(self):
        import os
        if os.path.exists(RUNS_PATH + str(self.pk) + '.exe') == 0:
            self.result = 'CMPE'
            self.save()
            return False
        return True

class TestCase(models.Model):
    problem = models.ForeignKey(Problem)
    inputFile = models.TextField()
    outputFile = models.TextField()
    
    def __unicode__(self):
        testCase = 'problem' + repr(self.pk)
        return testCase


# Forms 
class SubmissionForm(forms.Form):
    SubmissionLang = forms.CharField(widget=forms.Select(choices=LANG_TYPES))
    SubmissionCode = forms.CharField(widget=forms.Textarea(attrs={'rows':'30', 'cols':'80'}))

class TempRegForm(forms.ModelForm):
    class Meta :
        model = TempReg

class ChangePasswordForm(forms.Form):
    pass1 = forms.CharField(max_length=50, widget=forms.PasswordInput, label="Enter New Password")
    pass2 = forms.CharField(max_length=50, widget=forms.PasswordInput, label="Enter New Password Again")

    def clean_pass2(self):
        if len(self.cleaned_data['pass1']) < 6:
            raise forms.ValidationError('Password must be at least 6 letters long')
        if self.cleaned_data['pass1'] != self.cleaned_data['pass2']:
            raise forms.ValidationError('Passwords do not match')
        return self.cleaned_data['pass2']

