import glob
import os
import sys

if sys.version_info.major == 3:
    from tools import scons_utils_3 as scons_utils
else:
    from tools import scons_utils


# Setting up basis.
AddOption('--droplet_custom', action='store_true')
AddOption('--build_all', action='store_true')
env = Environment(ENV = os.environ,
                  BUILDERS = {'FortranInc' : scons_utils.FortranIncBuilderFunction})


# Custom clean
if env.GetOption('clean'):
    print ('Removing all from bin/*, *.o, *.os, *.so and *.a files. This overwrites default SCons behavior.')
    scons_utils.SconsCleanHandler()


# Configure basic env.
platform_spec = scons_utils.AutoconfigurePlatformSpec(env)
if not platform_spec:
    print ('Arch is not supported.')
    Exit(1)
scons_utils.ApplyToEnv(platform_spec, env, File)
env.SetOption("num_jobs", platform_spec.num_jobs)



if GetOption('droplet_custom'):
    print ('Building droplet project')
    env.Append(LIBS=platform_spec.system_libs)
    env.Append(LIBS=platform_spec.third_party_libs)
    
    Export('env')
    
    SConscript('auxiliary_projects/Droplet/SConscript')
