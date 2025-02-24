# FindCURL
# --------------
#
# Locate CURL library
#

if(NOT CURL_FOUND)
  find_package(PkgConfig)
  pkg_search_module(CURL libcurl)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CURL
  REQUIRED_VARS CURL_FOUND
  VERSION_VAR CURL_VERSION
  )

