file(REMOVE_RECURSE
  "libsundials_kinsol.pdb"
  "libsundials_kinsol.so"
  "libsundials_kinsol.so.6"
  "libsundials_kinsol.so.6.5.1"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/sundials_kinsol_shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
