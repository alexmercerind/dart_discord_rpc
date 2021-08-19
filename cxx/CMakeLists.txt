cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED 17)

set(PROJECT_NAME "dart_discord_rpc")
project(${PROJECT_NAME} LANGUAGES CXX)

add_library(${PROJECT_NAME} SHARED
  "dart_discord_rpc.cpp"
)

target_include_directories(
  ${PROJECT_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include"
)
target_link_libraries(
  ${PROJECT_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}/bin/discord-rpc.lib"
)

set(
  dart_discord_rpc_shared_library
  "$<TARGET_FILE:${PROJECT_NAME}>"
)