from django.conf.urls.defaults import patterns,include
import settings

# Remove the forward slashes ! 
location_root_url = settings.BASE_URL[1:]

urlpatterns = patterns('',
    # Put the root url conf string here.
    ( r"%s" % location_root_url, include( 'checker.cc_frontend.web.urls' ) ), 
)
