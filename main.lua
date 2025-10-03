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

local function process_template(template_path, output_path, project_name)
    local f = io.open(template_path, "r")
    if not f then
        print("Error: Template file " .. template_path .. " not found.")
        return
    end
    local content = f:read("*a")
    f:close()
    -- Replace placeholder with project name
    content = content:gsub("{{PROJECT_NAME}}", project_name)
    local out = io.open(output_path, "w")
    out:write(content)
    out:close()
end

if exstension == ".py" then
    -- Read the python_template.py file from the templates directory
    local template_file = io.open("templates/python_template.py", "r")
    if not template_file then
        print("Error: templates/python_template.py not found.")
        return
    end
    local template_content = template_file:read("*a")
    template_file:close()

    -- Write the template content to the new main.py
    local main_py = io.open(project_name .. "/src/main.py", "w")
    main_py:write(template_content)
    main_py:close()
    -- Process README.md template
    process_template("templates/README.md", project_name .. "/README.md", project_name)
    return 
end

process_template("templates/CMakeLists.txt", project_name .. "/CMakeLists.txt", project_name)
if exstension == ".c" then
    process_template("templates/MakeFile_c", project_name .. "/MakeFile", project_name)
else
    process_template("templates/MakeFile_cpp", project_name .. "/MakeFile", project_name)
end
process_template("templates/README.md", project_name .. "/README.md", project_name)
process_template("templates/.gitignore", project_name .. "/.gitignore", project_name)
io.close()