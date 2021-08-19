cmake_minimum_required(VERSION 3.15)
set(PROJECT_NAME "dart_discord_rpc")
project(${PROJECT_NAME} LANGUAGES CXX)

set(PLUGIN_NAME "dart_discord_rpc_plugin")

add_library(
  ${PLUGIN_NAME} SHARED
  "dart_discord_rpc_plugin.cpp"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)

# Adding pre-compiled shared library because Discord's clang-format will give warnings if added with sub_directory.
# If I compile on user's machine statically, _ITERATOR_DEBUG_LEVEL mismatch will happen.
# And, in case of a dynamic link, crash will happen in Debug mode. 

set(dart_discord_rpc_bundled_libraries
  "${CMAKE_CURRENT_SOURCE_DIR}/bin/dart_discord_rpc.dll"
  PARENT_SCOPE
)
