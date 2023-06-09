# General Info
- Luigi Raiano
- Templates for app deployment and installer creation of SW developed using Qt

## Dependencies
- Qt Creator
- Qt installer Framework (to be installed when installing Qt)

## App deployment
The app deployment allows the user to launch the application executable without the need of compiling and running the code from Qt Creator.

### Windows 10/11
1. From Start menu select and open Qt MinGW: `Qt -> Qt ${version} (MinGW ${version} 64-bit)`
2. Go to ExampleProject folder:
```
cd ${path_to_ExampleProject}
```
3. Create a new folder named `deploy`
```
mkdir deploy
```
4. Copy `${ExampleProject}.exe` from `build/release` to `deploy`
5. Go to deploy folder:
```
cd deploy
```
6. Add all necessary libraries for launching `${ExampleProject}.exe` without the need of compilying the code. To this aim, launch the following command from the  MinGW shell:
```
windeployqt.exe --quick .
```
7. All necessary libraries will be added to deploy folder allowing to launch the the Orchestrator GUI directly from the executable file.

### macOS
1. Go to ExampleProject folder:
```
cd ${path_to_ExampleProject}
```
2. Create a new folder named `deploy`
```
mkdir deploy
```
3. Copy the `${ExampleProject}.app` to `deploy`
```
cp build/${ExampleProject}.app deploy/${ExampleProject}.app
```
4. Launch deployment:
```
/Applications/Qt/${Qt_Version}/clang_64/bin/macdeployqt ${ExampleProject}.app -dmg
```
5. After completion, a file entitled `${ExampleProject}.dmg` will appear within `deploy` folder. Open this file and drag-and-drop `${ExampleProject}.app` to your `Applications` system dir.

## Creating the Installer
The SW installer allows the user to install all required libraries and components to launch the App without the need of receiving the source code.

### Windows 10/11
1. Deploy the application using the [App deployment on Windows](#Windows-10/11) guidelines.
2. Go to Desktop and create a new folder entitled `${ExampleProject}Installer`.
3. Here, create two subfolders entitled `config` and `packages`.
4. Within `config` create a `config.xml`.
5. Within `packages` create a new subfolder, entitled: `${ExampleProject}`. Here, create two further subfolders, `data` and `meta`.
6. `data` folder contains all files to be installed, e.g. the `deploy` folder, configuration files, logos, etc. Do not put here the source code if you do not want to provide it. As golden rule, add all data to be installed within a subfolder of `data` named `win64`.
7. `meta` folder contains scripts and files for generating the installer with its GUI. Add here also additional files, such as the license to be accepted.

All componetes are now ready and it is time to create the installer file. To this aim:
1. Open a terminal shell
2. Go to `${ExampleProject}Installer` folder, i.e. where `config` and `packages` have been created:
```
cd ${path_to_${ExampleProject}Installer}
```
3. Launch `QtInstallerFramework`:
```
C:\Qt\Tools\QtInstallerFramework\{QtInstallerFramework_version}\bin\binarycreator.exe -c config\config.xml -p packages ${ExampleProject}Installer.exe
```
4. At the end of the project, `${ExampleProject}Installer.exe` will appear in `${path_to_${ExampleProject}Installer}`.

### macOS
1. Deploy the application using the [App deployment on macOS](#macOS) guidelines.
2. Go to Desktop and create a new folder entitled `${ExampleProject}Installer`.
3. Here, create two subfolders entitled `config` and `packages`.
4. Within `config` create a `config.xml`.
5. Within `packages` create a new subfolder, entitled: `${ExampleProject}`. Here, create two further subfolders, `data` and `meta`.
6. `data` folder contains all files to be installed, e.g. `${ExampleProject}.dmg` or entirely the `deploy` folder, configuration files, logos, etc. Do not put here the source code if you do not want to provide it. As golden rule, add all data to be installed within a subfolder of `data` named `macOS`.
7. `meta` folder contains scripts and files for generating the installer with its GUI. Add here also additional files, such as the license to be accepted.

All componetes are now ready and it is time to create the installer file. To this aim:
1. Open a terminal shell
2. Go to `${ExampleProject}Installer` folder, i.e. where `config` and `packages` have been created:
```
cd ${path_to_${ExampleProject}Installer}
```
3. Launch `QtInstallerFramework`:
```
~/Applications/Qt/Tools/QtInstallerFramework/${Qt_version}/clang_64/bin/binarycreator -c config/config.xml -p packages ${ExampleProject}Installer
```
4. At the end of the project, `${ExampleProject}Installer.exe` will appear in `${path_to_${ExampleProject}Installer}`.