# FindLibM
# --------
#
# Find the native realtime includes and library.
#
# IMPORTED Targets
# ^^^^^^^^^^^^^^^^
#
# This module defines :prop_tgt:`IMPORTED` target ``LIBM::LIBM``, if
# LIBM has been found.
#
# Result Variables
# ^^^^^^^^^^^^^^^^
#
# This module defines the following variables:
#
#   LIBM_INCLUDE_DIRS  - where to find math.h, etc.
#   LIBM_LIBRARIES     - List of libraries when using libm.
#   LIBM_FOUND         - True if math library found.
#

find_path(LIBM_INCLUDE_DIRS
  NAMES math.h
)

find_library(LIBM_LIBRARIES
  NAMES libm m
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibM DEFAULT_MSG LIBM_LIBRARIES LIBM_INCLUDE_DIRS)
mark_as_advanced(LIBM_INCLUDE_DIRS LIBM_LIBRARIES)

if(LIBM_FOUND)
  if(NOT TARGET libm::libm)
    add_library(libm::libm UNKNOWN IMPORTED)
    set_target_properties(libm::libm
      PROPERTIES
        IMPORTED_LOCATION "${LIBM_LIBRARIES}"
        INTERFACE_INCLUDE_DIRECTORIES "${LIBM_INCLUDE_DIRS}"
    )
  endif()
endif()
