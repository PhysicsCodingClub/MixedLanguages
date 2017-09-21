from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    name = "Something",
    
    cmdclass = {"build_ext":build_ext},
    
    ext_modules = [ Extension("mymodule",     # The name of the module to create
                              ["cscalars.pyx"], 
                              libraries=["scalars"]) ]
    
)
