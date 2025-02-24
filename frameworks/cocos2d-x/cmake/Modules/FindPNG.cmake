# FindPNG
# --------------
#
# Locate PNG library
#

if(NOT PNG_FOUND)
  find_package(PkgConfig)
  pkg_search_module(PNG libpng)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PNG
  REQUIRED_VARS PNG_FOUND
  VERSION_VAR PNG_VERSION
  )

