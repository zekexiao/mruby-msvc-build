cmake_minimum_required(VERSION 3.15)

if(NOT PROJECT_NAME)
  project(mruby
    VERSION 4.0.0
    DESCRIPTION "mruby - Lightweight Ruby"
    LANGUAGES C CXX
  )
endif()

# Pre-built mruby MSVC static library target.
# Use this directory as a CMake subdirectory:
#   add_subdirectory(/path/to/mruby-prebuilt mruby-prebuilt)
#   target_link_libraries(your_target PRIVATE mruby::mruby)

add_library(mruby STATIC IMPORTED GLOBAL)
add_library(mruby::mruby ALIAS mruby)

set_target_properties(mruby PROPERTIES
  IMPORTED_LOCATION "${CMAKE_CURRENT_LIST_DIR}/lib/libmruby.lib"
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/include"
)
