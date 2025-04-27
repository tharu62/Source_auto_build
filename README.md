# SAB
This program is made for building a project structure fast, without manually making the folders and the CMakeList.txt from scratch.
As it is used for my personal purposes i will customize the program for my own preferences.
it makes C, C++ and Python projects on Linux (the program also works on Windows 11 but i will not give any install information).
## PRE-REQUIREMENTS
This programm run on Lua. It is required to have Lua and the module lfs pre-installed in the system.
If you don't have Lua installed, run the next few commands:
```bash
sudo apt install lua5.4
sudo apt install luarocks
luarocks install luafilesystem
```
## INSTALL
Clone the repo in your prefered directory (let's call its absolute path "Path_to_Program"). Make a file in the "/bin" folder of your Linux system.
```bash
cd /bin
sudo nano <file_name> 
```
Inside the file write your own personal command to access the programm, like this:
```bash
<my_personal_command>=sudo lua <Path_to_Program>/main.lua
```
Save and exit. 
Give the new executable the necessary permission to run:
```bash
sudo chmod a+x /bin/<file_name>
```
You can now run the programm anywhere in the system.

## USE and CONTENT
The project is organised in one project folder containing:
1) inlcude directory
2) src directory with main file (blank)
3) CMakeLists.txt (partially precompiled)
4) MakeFile (blank)
5) gitignore file (precompiled)

To use the program write on terminal the chosen command_name and 2 arguments
1) Extension of the main file : c, cpp or py.
2) Name of the Project folder.

Example :
```bash
sab cpp Test
```
where sab is the command_name I chose.

## WARNINGS
The program will NOT remove or overwrite any already existing files, but it is recomended to NOT run this command in any sensitive or critical areas of your system.
