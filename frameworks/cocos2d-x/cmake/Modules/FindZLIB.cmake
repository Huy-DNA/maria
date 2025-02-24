# FindZLIB
# --------------
#
# Locate ZLIB library
#

if(NOT ZLIB_FOUND)
  find_package(PkgConfig)
  pkg_search_module(ZLIB zlib)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ZLIB
  REQUIRED_VARS ZLIB_FOUND
  VERSION_VAR ZLIB_VERSION
  )

