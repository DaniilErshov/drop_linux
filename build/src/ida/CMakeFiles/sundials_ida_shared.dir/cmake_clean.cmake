file(REMOVE_RECURSE
  "libsundials_ida.pdb"
  "libsundials_ida.so"
  "libsundials_ida.so.6"
  "libsundials_ida.so.6.5.1"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/sundials_ida_shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
