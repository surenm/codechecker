from distutils.core import setup

setup(name='codechecker',
      version='1.0',
      description='Codechecker components',
      long_description='A Python based software to host'
                       'Online Programming Contests',
      author='Suren, Aditya and Krishnan',
      author_email='codechecker@googlecode.com', 
      license='GPLv3',
      url='http://code.google.com/p/codechecker',
      platforms='All',
      packages=['checker',
                'checker.cc_backend', 
                'checker.cc_backend.compiler', 
                'checker.cc_backend.evaluator',
                'checker.cc_backend.score', 
                'checker.cc_backend.se', 
                'checker.cc_backend.store',
                'checker.cc_frontend',
                'checker.cc_frontend.web',
                ],
      package_dir={'checker' : 'src/checker'}
      )


