Minimalist Simulink Coder Target for Linux
============================================

Authors: Martin Gurtner <martin.gurtner@fel.cvut.cz>
         Lukas Hamacek <hamacl1@fel.cvut.cz>
         Pavel Pisa <pisa@cmp.felk.cvut.cz>
         Michal Sojka <michal.sojka@cvut.cz>

The project has been initiated and is maintained by:
         Czech Technical University in Prague
         Faculty of Electrical Engineering
         Department of Control Engineering
         https://dce.fel.cvut.cz/

The aim of this target is to allow Simulink to generate code that
runs in real-time on Linux, preferably with fully preemptive kernel.
This target tries to be minimalist in the sense that it reuses
as much as possible from Simulink built-in targets.

Installation
------------

In Matlab prompt execute:

    cd <root>/ert_linux/ert_linux
    ert_linux_setup

From now on, Code Generation pane of Simulink Model Configuration
Parameters should offer `ert_linux.tlc` as System Target File (after
pressing "Browse...." button).

Documentation
-------------

In order to cross-compile the generated source, modify the "Make
command" in Code Generation pane to set the CC variable (and/or CPP
for C++ compiler). For example:

    make_rtw CC=arm-linux-gnueabi-gcc

Pointers to more ERT Linux target documentation can be found at the
project SourceForge page

  http://lintarget.sourceforge.net/

In addition to the target documentation, there are documented
applications (PMSM control, CAN etc.) and related packages
for SocketCAN, Humusoft MF624 data acquisition boards
and more at related Lintarget site

Michal Sojka's blogpost about the actual version can be found at
http://rtime.felk.cvut.cz/~sojka/blog/on-generating-linux-applications-from-simulink/.

Development Sources Repository
------------------------------

Newest version of this project can be found at

  https://github.com/aa4cc/ert_linux/

Tested Hardware Platforms and Systems
-------------------------------------

This target has been tested with Matlab R2017a
and Humusoft MF624 cards with Linux kernels up to 4.19 RT
on 64-bit x86 Debian GNU/Linux system, ARM based Xilinx Zynq
systems and AArch64 Nvidia based systems.
