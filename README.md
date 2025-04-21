# SAB
This program is made for building a project structure fast, without manually making the folders and the CMakeList.txt from scratch.
As it is used for my personall purposes i will customize the program for my own preferences.
it makes C, C++ and Python projects on Linux.
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
