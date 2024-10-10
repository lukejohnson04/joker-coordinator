@echo off
pushd build
call "shell.bat"
popd
pushd misc
call "emacs.bat"
popd
cd build
cmd /k