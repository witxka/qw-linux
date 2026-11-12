Install linux custom kernel special for gaming (be aware of time to compile
the kernel and memory for compiler. I used llvm clang.
 
# First step install lattest llvm clang compiller
```
cat  /etc/apt/sources.list.d/archive_uri-https_apt_llvm_org_resolute_-resolute.list 
  deb https://apt.llvm.org/resolute/ llvm-toolchain-resolute-23 main
  # deb-src https://apt.llvm.org/resolute/ llvm-toolchain-resolute-23 main
```

# Than get and compile the kernel
https://github.com/frogging-family/linux-tkg

git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
./install.sh install
3) Ubuntu
> 0) v7.3.4
 > eevdf:
1) Clang/LLVM
1) Full: 
znver5:
> 5) 1000 Hz
> 2) Just tickless idle plz
> N/y : 
Found config fragment nvme.myfrag, apply it? [y/N]  - y
> 0. nope

note for nvme.myfrag - it needed to boot kernel from nvme disk
```
cat nvme.myfrag 
  CONFIG_BLK_DEV_NVME=y
  CONFIG_NVME_CORE=y
```

# After all reboot and check for new kernel 
reboot
uname -a
