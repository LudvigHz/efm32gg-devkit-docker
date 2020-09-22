================ energyAware Profiler =======================================

This package contains energyAware Profiler for Silicon Laboratories kits.

The energyAware Profiler is a tool developed to let developers quickly 
visualize the energy consumption in their applications and perform 
optimizations to reduce power consumption.

The energyAware Profiler uses the built in PC sampling and IRQ event tracking
in the EFM32. Power is measured using the built-in AEM in the Gecko
Development Kit or Starter Kit. 

The profiler correlates the PC sampling with the current measurements from the 
kit. It displays this information in the form of a graph. By using the 
debug information embedded in the object code it is possible to correlate
a point on this graph with a specific point in the graph.

Thus it is possible to build an energy profile to show which functions
is responsible for the energy consumption.


================ Prerequisites for the energyAware Profiler ==================

The energyAware Profiler requires that the SEGGER J-Link software pack is
installed. It can be downloaded from:
        
         http://www.segger.com/cms/jlink-software.html


================ Setting up the energyAware Profiler =========================

To use the energyAware Profiler it is necessary to setup the program for SWO
output prior ot using the energyAware Profiler. When starting the profiler, 
it will show a snippet of code called setupSWO(). Insert this function into
your own program and call the function early in main.

Note that using the SWO functionality adds to the current consumption. 

The code must be compiled with debugging information enabled. Selecting the
'Debug' mode will, in most IDEs, embedd such information in the resulting
ELF binary. If such information is not present the profiler will be unable to
correlate the PC of the program to the source code.


================ Using the energyAware Profiler ==============================

To use the energyAware Profiler simply set up your project using the 
setupSWO() function introduced in the previous section. Compile and flash
the EFM32 with the new program. This will activate the debug interface which 
will prevent the EFM32 from entering EM2. To solve this issue simply reset 
the EFM32 or the kit.

Start the energyAware profiler by double clicking on "profiler.exe". 
By pressing on the play icon the profiler will start displaying current
information in the AEM window. Checking the box "Annotate IRQ" will show
IRQ events as coloured pins on the graph.

Select the corresponding object file in "Debug->Set object file". 

Clicking anywhere on the graph will display the corresponding source line
in the "Code view" window. 

The energy profile is updated every 100 samples and is sorted by energy.
Double clicking on a function lets you chose a colour for that function.
This color will be used when drawing the graph. This will let you see which
functions are active in a time interval.


================ Licenses ====================================================

DISCLAIMER OF WARRANTY/LIMITATION OF REMEDIES: Silicon Laboratories has no
obligation to support this Software. Silicon Laboratories is providing the
Software "AS IS", with no express or implied warranties of any kind,
including, but not limited to, any implied warranties of merchantability
or fitness for any particular purpose or warranties against infringement
of any proprietary rights of a third party.

Silicon Laboratories will not be liable for any consequential, incidental, or
special damages, or any other relief, or for any claim by any third party,
arising from your use of this Software.


The energyAware Profiler uses a number of third party LGPL licensed libraries:

Qt     
       http://qt-project.org/
LibElf 
       http://www.mr511.de/software/english.html
LibDwarf 
       http://reality.sgiweb.org/davea/dwarf.html

Please see the file LGPL.txt for details.

LibElf and LibDwarf are statically linked into the binary. According to
the LGPL, you have the right to relink the binary yourself if you so chose. 
If you wish to practice this right, please contact us and we will provide 
you with a binary that can  be used to link with these libraries.

According to the LGPL, you have the right to receive full source code for the
LGPL licensed libraries we use. Contact us to get access to the source code 
for these libraries, or alternatively, download them from their respective 
project pages.


To contact us, please go to:

http://support.energymicro.com,

or send a letter to:

Silicon Laboratories 
P.O.Box 4633 Nydalen 
N-0405 Oslo
NORWAY 

================ Software updates ============================================

Silicon Laboratories continually works to provide updated and improved versions of the 
energyAware Profiler, example code and other software of use for EFM32 
customers. Please check the download section of 

        http://www.energymicro.com/downloads

for the latest releases, news and updates. 

               (C) Copyright Silicon Laboratories, Inc 2013

=============== FAQ ==========================================================

Q: The current consumption is never below 1 mA, even though my program enters
   EM2 or lower on many occasions.

A: This can happen if the EFM32 has entered debugging mode. When the EFM32 is
   in debugging mode it cannot enter EM2 or lower. To resolve this issue
   simply reset the EFM32.

Q: The current consumption is about 80 uA in EM2.

A: This happens on some kits with firmware version 1v3 or earlier. This is
   due to a bug in the debugger which leaves one of the debugging pins high
   against the internal pull-downs on the EFM32. Simply reset the kit to 
   resolve this issue.

Q: Sometimes the PC or IRQ number is clearly wrong.

A: This happens when the EFM32 quickly oscillates between sleep and active
   mode. The profiling functionality in the EFM32 is only active in EM0 and 
   EM1. However, if the EFM32 goes to sleep while transmitting a packet the
   packet can become corrupted. This problem can be alivieated by enabling
   the debug clock in EM2. Setting EMVREG in EMU->CTRL to full will enable
   the trace functionality at all times. However, doing so will increase the
   power consumption in EM2 by about 200uA.

Q: I have selected an object file, but there is nothing shown when clicking
   on the graph.
 
A: This can have multiple causes. First, make sure that the object file 
   contains debugging information. Second, the DWARF information used in 
   ELF object files uses absolute paths. If you copy the binary from one 
   machine to another this can result in the paths being wrong.
