cmake_minimum_required(VERSION 3.28)
project({{PROJECT_NAME}} LANGUAGES CXX)

include_directories(include)
add_executable(main src/main.cpp)
target_compile_features(main PRIVATE cxx_std_17)