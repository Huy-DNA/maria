# FindSqlite3
# --------------
#
# Locate Sqlite3 library
#

if(NOT Sqlite3_FOUND)
  find_package(PkgConfig)
  pkg_search_module(Sqlite3 sqlite3)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  Sqlite3
  REQUIRED_VARS Sqlite3_FOUND
  VERSION_VAR Sqlite3_VERSION)
