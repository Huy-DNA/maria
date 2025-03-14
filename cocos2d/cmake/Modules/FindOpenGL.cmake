# FindOpenGL
# --------------
#
# Locate OpenGL library
#

find_package(PkgConfig QUIET)
pkg_check_modules(PC_OPENGL IMPORTED_TARGET opengl)

if(PC_OPENGL_FOUND AND TARGET PkgConfig::PC_OPENGL)
  #
  # If the "opengl" module exists, it should be preferred; and the library name
  # will typically be libOpenGL.so; This is a modern Unix-ish convention and
  # expected to be always provided by pkg-config modules, so there is no need to
  # fall-back to manually using find_path() and find_library().
  #
  if(NOT TARGET OpenGL::OpenGL)
    add_library(OpenGL::OpenGL INTERFACE IMPORTED GLOBAL)
    set_property(TARGET OpenGL::OpenGL PROPERTY INTERFACE_LINK_LIBRARIES
                                                PkgConfig::PC_OPENGL)
  endif()

  get_target_property(OpenGL_LIBRARY PkgConfig::PC_OPENGL
                      INTERFACE_LINK_LIBRARIES)
else()
  # Otherwise, if an "opengl" pkg-config module does not exist, check for the
  # "gl" one, which may or may not be present.
  #
  pkg_check_modules(PC_OPENGL gl)
  find_path(
    OpenGL_INCLUDE_DIR
    NAMES GL/gl.h
    HINTS ${PC_OPENGL_INCLUDEDIR} ${PC_OPENGL_INCLUDE_DIRS})

  find_library(
    OpenGL_LIBRARY
    NAMES ${OpenGL_NAMES} gl GL
    HINTS ${PC_OPENGL_LIBDIR} ${PC_OPENGL_LIBRARY_DIRS})

  if(OpenGL_LIBRARY AND NOT TARGET OpenGL::OpenGL)
    add_library(OpenGL::OpenGL UNKNOWN IMPORTED GLOBAL)
    set_target_properties(
      OpenGL::OpenGL
      PROPERTIES IMPORTED_LOCATION "${OpenGL_LIBRARY}"
                 INTERFACE_COMPILE_OPTIONS "${PC_OPENGL_CFLAGS_OTHER}"
                 INTERFACE_INCLUDE_DIRECTORIES "${OpenGL_INCLUDE_DIR}")
  endif()
endif()

set(OpenGL_VERSION "${PC_OPENGL_VERSION}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  OpenGL
  REQUIRED_VARS OpenGL_LIBRARY
  FOUND_VAR OpenGL_FOUND)

mark_as_advanced(OpenGL_INCLUDE_DIR OpenGL_LIBRARY)

if(OpenGL_FOUND)
  set(OpenGL_LIBRARIES ${OpenGL_LIBRARY})
  set(OpenGL_INCLUDE_DIRS ${OpenGL_INCLUDE_DIR})
endif()
