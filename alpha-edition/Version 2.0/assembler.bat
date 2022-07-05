ECHO OFF
cls
echo Montando o arquivo: bootloader
nasm -f bin bootloader.asm -o binary/bootloader.bin
echo Montando o arquivo: kernel
nasm -f bin kernel.asm -o binary/kernel.bin
echo Montando o arquivo: intro
nasm -f bin intro.asm -o binary/intro.bin
echo Montando o arquivo: windows
nasm -f bin windows.asm -o binary/windows.bin
echo Montando o arquivo: cmd
nasm -f bin cmd.asm -o binary/cmd.bin
pause