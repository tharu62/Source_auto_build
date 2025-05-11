require "lfs"

-- This script creates a new CMake project directory structure

-- print("Enter the programming language (c/cpp/py): ")
-- exstension = io.read("*l")

exstension = arg[1]
if exstension == "c" then
    exstension = ".c"
elseif exstension == "cpp" then
    exstension = ".cpp"
elseif exstension == "py" then
    exstension = ".py"
else
    print("Error arg[1] : Invalid programming language. Please enter c, cpp, or py.")
    return
end

-- print("Enter the name of the project:")
-- project_name = io.read("*l") 

project_name = arg[2]

if project_name == nil or project_name == "" then
    print("Error arg[2] : Invalid project name.")
    return
end

if lfs.attributes(project_name) then
    print("Error arg[2] : Project name already exists.")
    return
end

lfs.mkdir(project_name)
lfs.mkdir(project_name .. "/build")
lfs.mkdir(project_name .. "/include")
lfs.mkdir(project_name .. "/src")
io.output(project_name .. "/src/main" .. exstension)
io.output(project_name .. "/README.md")

if exstension == ".py" then
    io.close()
    return 
end

io.output(project_name .. "/CMakeLists.txt")

-- fill the CMakeLists.txt 
io.write("cmake_minimum_required(VERSION 3.28)\n")
io.write("project(" .. project_name .. " LANGUAGES CXX)\n\n\n")
io.write("include_directories(".. "include" .. ")\n")
io.write("add_executable(main src/main.cpp)\n")
io.write("target_compile_features(main PRIVATE cxx_std_17)\n")
io.close()

-- fill the MakeFile
io.output(project_name .. "/Makefile")
if exstension == ".c" then
    io.write("CC = gcc\n")
    io.write("CFLAGS= -Wall -Werror -Wextra -std=c++17\n")
    io.write("LDFLAGS= -Iinclude -LC:$(HOME)/Documents/C/" .. project_name .. "/include\n\n")
else
    io.write("CC = g++\n")
    o.write("CFLAGS= -Wall -Werror -Wextra -std=c++17\n")
    io.write("LDFLAGS= -Iinclude -LC:$(HOME)/Documents/C++/" .. project_name .. "/include\n\n")
end
io.write("SRC_F=src\n")
io.write("BUILD_F=build\n\n")
io.write("default: app.exe run\n")
io.write("file.exe :app.o\n")
io.write("\t$(CXX) $(BUILD_F)/app.o $(LDFLAGS) -o $(BUILD_F)/app.exe\n\n")
io.write("app.o:\n")
io.write("\t$(CXX) -c $(SRC_F)/main.c $(LDFLAGS) -o $(BUILD_F)/app.o\n\n")
io.write("run: app.exe\n")
io.write("\t./$(BUILD_F)/app.exe\n")

io.output(project_name .. "/.gitignore")
io.write(".vscode\n")
io.write(".gitignore\n")
io.write("Makefile\n")
io.write("CMakeLists.txt\n")
io.write("build/\n")
