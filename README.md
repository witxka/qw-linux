# qw-linux
Here are some tips to run quakeworld client on Linux with maximum FPS.

Setup shows 20000fps for 1280x720 with FSR to 2560x1440 on povdmm4.

![20000fps](ezquake046.jpg)
# System setup
* MAG B650 TOMAHAWK WIFI (MS-7D75)
* AMD Ryzen 7 9850X3D 8-Core Processor
* 2x16GB DDR5 6000 MHz (0,2 ns)
* PowerColor Red Devil adeon RX 9070 XT 16GB GDDR6 
* Peripherals
  * Asmedia PCIe x4 v3.0 ASM3142 USB3.2 Gen2x1, 2xTypeC
    * Mouse G-Wolves HSK Pro 8K
  * Keyboard NuPhy Air75 HE 
# Software
* Ubuntu 26.04.1 LTS
* unezquake 2.1.3
# Setup tasks
* [Peripherals](tasks/peripherals.md)
* [Kernel](tasks/kernel.md)
* [Scheduler](tasks/scheduler.md)
* [Radeon](tasks/radeon.md)
* Playing environment setup
  * [Gamemode](tasks/gamemode.md)
  * [Gamescope](tasks/gamescope.md)
  * [unezquake](tasks/unezquake.md)
# Run
Copy running script from files/run.lavd.gamescope.gamemode.unezquake.sh to folder with unezquake client
# Tests
1. Test mouse responsibility with evzh
```
git clone https://github.com/marcoster/evhz.git
cd evhz
./run
```
2. Benchark qw client
type in console /timedemo2 demos/fps5 77
or use ciscon script put files/quake-benchmark to the directory with unezquake
```
 ./quake-benchmark 
running 3 timedemos of fps5 at 77fps...

93646 frames  16.9 seconds 5538.0 fps
93646 frames  16.6 seconds 5639.0 fps
93646 frames  16.8 seconds 5562.7 fps

CPU: AMD Ryzen 7 9850X3D 8-Core Processor
GPU: AMD Radeon RX 9070 XT (radeonsi, gfx1201, ACO, DRM 3.64, 7.3.3-tkg-eevdf-llvm)
Resolution: 2560x1440@240hz [fullscreen]
Version: NA
```
# Notes
All steps could be used separately here just all of them in one place
