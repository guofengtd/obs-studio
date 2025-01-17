include_guard(DIRECTORY)

find_package(nlohmann_json REQUIRED)

if(NOT TARGET OBS::blake2)
  add_subdirectory("${CMAKE_SOURCE_DIR}/deps/blake2" "${CMAKE_BINARY_DIR}/deps/blake2")
endif()

target_sources(
  obs-studio
  PRIVATE update/crypto-helpers.hpp
          update/crypto-helpers-mac.mm
          update/shared-update.cpp
          update/shared-update.hpp
          update/update-helpers.cpp
          update/update-helpers.hpp
          update/models/branches.hpp
          update/models/whatsnew.hpp)

target_link_libraries(obs-studio PRIVATE "$<LINK_LIBRARY:FRAMEWORK,Security.framework>" nlohmann_json::nlohmann_json
                                         OBS::blake2)
