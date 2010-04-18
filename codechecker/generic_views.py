from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext as Context, loader
from django.shortcuts import render_to_response
from django.core.mail import send_mail,EmailMessage
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth import authenticate, login
import random, time, datetime, re

from codechecker.contests.models import TempReg, TempRegForm, Team, ChangePasswordForm
from codechecker import settings

def debug(obj):
    import sys
    print >> sys.stderr,'[debug] ' + repr(obj)
    sys.stderr.flush()

def default(request, action='base'):
    template = loader.get_template(action + ".html")
    context = Context(request)
    return HttpResponse(template.render(context))

def makemsg(username,url):
    msg = " Dear %(username)s,\n\n\
            Thank you for registering with us. Please visit this url:\n\n\
            %(url)s\n\n\
            to complete the registration\n\n\
            Regards,\n\
            CodeLabs Team." % {'username': username,'url': url}
    return msg

def register(request):
    vars = {}
    # check if the user is logged in first 
    if request.user.is_authenticated() :
        message = 'You are already Registered and Logged in'
        return render_to_response("accounts/register.html",{'message': message},context_instance=Context(request))

    if request.POST :
        # On POST method.
        form = TempRegForm(request.POST)
        if form.is_valid():
            # If form is clean and has no errors.
            fm = form.cleaned_data
            if(len(fm['name']) > 25 or len(fm['name']) < 3):
                form.errors['name'] = ['User name should be atleast 3 characters long and at most 25 characters long']
            elif (fm['teamSize'] > 3) :
                form.errors['teamSize'] = ['A team cannot be of more than 3 members']
            else:
                r = re.compile(r"[A-Za-z0-9_]")
                for alph in fm['name']:
                    # Check if every character of the username is either an 
                    # alphabet or numeral.
                    if  not r.match(alph):
                        form.errors['name']=[("Invalid character %s in Team name") %(alph)]
                if not form.errors:
                    test = User.objects.filter(username__iexact=fm['name'])
                    # Check if username already exists.
                    if test:
                        form.errors['name'] = ["Team name registered, try something else"]
                    else:
                        # Check if username is pending registration ie has not completed
                        # the formality of activating self through mail.
                        test1 = TempReg.objects.filter(name__iexact=fm['name'])
                        if test1:
                            form.errors['name'] = ["Team Name pending registration. Try tomorrow, contact admin"]

                    # Check if the email id has already been in use.
                    teste = User.objects.filter(email__iexact=fm['primary_email'])
                    if teste:
                        form.errors['primary_email'] = ["Email registered. Try something else"]
                    else:
                        # If username is found in the temporary registration database
                        # then show pending error message.
                        teste1 = TempReg.objects.filter(primary_email__iexact=fm['primary_email'])
                        if teste1:
                            form.errors['primary_email'] = ["Email pending registration. Try tomorrow"]
                    
            
            if not form.errors:
                new_reg = form.save()
                new_reg.code = str(random.random())[2:]
                new_reg.save()
                url = 'http://' + settings.HOST +  '/site/activate/' + new_reg.code
                mg = makemsg(new_reg.name, url)
                subject = "Confirm Registration for your login at Codelabs" 
                frm = settings.DEFAULT_FROM_EMAIL
                to = [new_reg.primary_email]
                send_mail(subject, mg, frm, to, fail_silently=False)
                return render_to_response("accounts/register.html", {'message': 'Thank you for Registering, please Check your mail to confirm'}, context_instance=Context(request))
    else :
        form = TempRegForm()
    return render_to_response("accounts/register.html",{"form":form}, context_instance=Context(request))

def activate(request, code):
    if code :
            user = TempReg.objects.get(code__exact=str(code))
            if not user : 
                return render_to_response("accounts/register.html", {'message' : 'Sorry ! Does not seem to be a valid key'})

            data = {}
            if user :
                data['email'] = user.primary_email
                data['code'] = user.code
                data['username'] = user.name
                new_team = Team(name=user.name, teamSize = user.teamSize, 
                        primary_email = user.primary_email,
                        primary = user.primary,
                        secondary_email = user.secondary_email,
                        secondary = user.secondary,
                        tertiary_email = user.tertiary_email,
                        tertiary = user.tertiary,
                        )
                user.delete()

                new_user = User.objects.create_user(username = data['username'], email = data['email'], password = data['code'])
                new_user.save()
                new_user = User.objects.get(username = data['username'])
                new_team.user = new_user
                new_team.save()
                user = authenticate(username=data['username'], password=data['code'])
                login(request,user)
                
                return HttpResponseRedirect('/site/change_password_first_time/') 

    return render_to_response("accounts/register.html", {'message' : 'Sorry ! No valid Key given'})

@user_passes_test(lambda u: u.is_anonymous()==False ,login_url="/site/login/") 
def change_password(request):
    if request.POST :
        form = ChangePasswordForm(request.POST)
        if form.is_valid():
            fm = form.cleaned_data
            user = User.objects.get(pk=request.user.id)
            if fm.get('pass1') and fm.get('pass2') :
                user.set_password(fm['pass1'])
            user.save()
            
            return render_to_response("accounts/pchange.html", {"message" : "Password has been Saved successfully and account activated Successfully. Go ahead and solve problems ! "}, context_instance=Context(request))
    else :
        form = ChangePasswordForm()
        user = User.objects.get(pk=request.user.id)
    
    return render_to_response("accounts/pchange.html", {"form": form , "message" : "Please choose a password of your choice to complete Registration", "team" : user.username }, context_instance=Context(request))
