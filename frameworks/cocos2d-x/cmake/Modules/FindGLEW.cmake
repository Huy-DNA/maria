# FindGLEW
# --------------
#
# Locate GLEW library
#

if(NOT GLEW_FOUND)
  find_package(PkgConfig)
  pkg_search_module(GLEW glew)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLEW
  REQUIRED_VARS GLEW_FOUND
  VERSION_VAR GLEW_VERSION
  )

