import os
import sys
import shutil
from distutils.core import setup
from django.core.management import execute_manager


# TODO:One step installation file

prefix = "/usr/local/"
backend_conf = os.path.join(prefix, 'etc/checker/')
frontend_conf = os.path.join(prefix, 'etc/apache/')
media_dir = os.path.join(prefix, 'share/checker/') 
secexec = os.path.join(prefix, 'bin/secexec')

# check if django exists first
try :
    import django
except ImportError :
    sys.stderr.write( ''' 
---------------------------------------------------------------------------
Could not find Django, please install Django first.\n
sys.stderr.write( "Please install Django from www.djagoproject.com.\n
---------------------------------------------------------------------------
''' )
    exit(1)
# check if python mysql exists
try :
    import MySQLdb
except ImportError :
    sys.stderr.write( '''
---------------------------------------------------------------------------
python-mysqldb is not installed. Please install from apt/yum\n
---------------------------------------------------------------------------
''' )
    exit(1)

# create etc/checker conf directory if not exists already 
if not os.path.exists( backend_conf ):
    os.mkdir( backend_conf )

# create etc/apache conf directory if not exists already     
if not os.path.exists( frontend_conf ):
    os.mkdir( frontend_conf )

# create media directory
if not os.path.exists( media_dir ) :
    os.mkdir( media_dir )
    
# Copy the settings.py from sample file and ask to populate the mysql data
shutil.copy( os.path.join( os.getcwd(), 'conf/settings.conf' ),
             os.path.join( backend_conf, 'settings.conf' ) )

# copy all python modules
ret_code = os.system( "python setup.py install" )
if not ret_code == 0 :
    sys.exit(ret_code)

# copy the codechecker.conf to @prefix/etc/checker
shutil.copy( os.path.join( os.getcwd(), 'conf/codechecker.conf'), os.path.join( backend_conf, 'codechecker.conf' ) )

# copy the apache conf file
shutil.copy( os.path.join( os.getcwd(), 'conf/django.conf'), os.path.join( frontend_conf, 'django.conf') )

# set permissions
os.system('sudo chmod -R 750 %s' % backend_conf)
os.system('sudo chmod -R 750 %s' % frontend_conf)


# copy the media folder to /usr/local/share/checker/media
# and remove it if already present 
if os.path.exists( media_dir + 'media/'):
    shutil.rmtree( media_dir + 'media/' )
    
if os.path.exists( media_dir + 'templates/'):
    shutil.rmtree( media_dir + 'templates/' )

if os.path.exists( '/var/www/media/' ):
    shutil.rmtree('/var/www/media/')

shutil.copytree(os.getcwd() + '/media', media_dir + 'media/' )

# Copy templates to /usr/local/share/checker
shutil.copytree(os.getcwd() + '/src/checker/cc_frontend/templates', media_dir + 'templates/')

# this is a temporary copy to /www/media
shutil.copytree(os.getcwd() + '/media', '/var/www/media/' )

# copy secexec to /usr/local/bin
os.system('sudo bash ./build_secexec.sh')

# mount bind stuff for jail
dirs = [ 'bin', 'etc', 'lib', 'opt', 'proc', 'sbin', 'usr', 'var']
for dir in dirs:
    os.system('sudo umount /jail/%s' % dir)
    os.system('sudo mkdir -p /jail/%s' % dir)
    os.system('sudo mount --bind /%s /jail/%s' % (dir, dir) )

if not os.path.exists('/jail/runs/autobot/submissions'):
    os.system('sudo mkdir -p /jail/runs/autobot/submissions')

os.system('mysql -u root -proot checker < ./utils/checker.sql')
os.putenv('DJANGO_SETTINGS_MODULE', 'checker.cc_frontend.settings')
os.chdir('/usr/local/lib/python2.7/dist-packages/')
os.system('python checker/cc_backend/Checker.py')
