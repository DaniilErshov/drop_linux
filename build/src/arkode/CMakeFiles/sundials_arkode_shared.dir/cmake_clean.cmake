file(REMOVE_RECURSE
  "libsundials_arkode.pdb"
  "libsundials_arkode.so"
  "libsundials_arkode.so.5"
  "libsundials_arkode.so.5.5.1"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/sundials_arkode_shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
