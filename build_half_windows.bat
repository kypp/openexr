mkdir lib
set libdir=%cd%\lib
cd IlmBase/Half
mkdir vs
cd vs
cmake -G "Visual Studio 14" ..
call "%programfiles(x86)%\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86
set include=%cd%;%include%
msbuild /p:useenv=true;configuration=debug Half.vcxproj
msbuild /p:useenv=true;configuration=release Half.vcxproj
echo %libdir%
xcopy Debug %libdir%\Debug\ /y
xcopy Release %libdir%\Release\ /y