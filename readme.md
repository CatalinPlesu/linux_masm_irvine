# installs masm on linux ( probably on mac too ) 

## dependencies
wine, wine-mono

# for now it dont work

## run
```
./install.sh
```
press **install** (earth image) when installing masm 

**build_masm** will be added to ~/.local/bin
if it isn't in your PATH add it

## usage
```
build_masm asm_code
```
for my usecase I needed and x16 architecture so in this repo is a x16 builder
you will need dosbox to run it

[this script follows the steps from](https://github.com/detjensrobert/homework-2021-winter/tree/3bc299b5d61a28c271589a3e31cff6dbf6e30a0e/cs271/masm-setup)
