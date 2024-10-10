@echo off
pushd "B:\dev\Prototypes\joker-coordinator\build"

set build=DEBUG

set DebugCompilerFlags= /Zi /Zo /DDEBUG
set ReleaseCompilerFlags= /O2 /Oi /DRELEASE
set CommonCompilerFlags= /MP /GR- /EHsc /WX /W4 /wd4201 /wd4100 /wd4189 /wd4505 /wd4127 /wd4702
set CompilerFlags=

set Includes= /I "./" /I "../"

set CommonLinkerFlags= -incremental:no
set LinkerFlags=

if %build% == RELEASE (
    set CompilerFlags= %ReleaseCompilerFlags% %CommonCompilerFlags%
    set LinkerFlags= %ReleaseLinkerFlags% %CommonLinkerFlags%

    echo Release
)
if %build% == DEBUG (
    set CompilerFlags= %DebugCompilerFlags% %CommonCompilerFlags% 
    set LinkerFlags= %DebugLinkerFlags% %CommonLinkerFlags%

    echo Debug
)


cl %CompilerFlags% "../src/main.cpp" %Includes% /link %LinkerFlags%
popd
