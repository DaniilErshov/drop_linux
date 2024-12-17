file(REMOVE_RECURSE
  "libsundials_idas.pdb"
  "libsundials_idas.so"
  "libsundials_idas.so.5"
  "libsundials_idas.so.5.5.1"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/sundials_idas_shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
