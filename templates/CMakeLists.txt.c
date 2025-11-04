cmake_minimum_required(VERSION 3.28)
project({{PROJECT_NAME}} LANGUAGES C)

include_directories(include)
add_executable(main src/main.c)
target_compile_features(main PRIVATE cxx_std_17)
