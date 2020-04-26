# ECE3300L
Work for ECE3300L - Digital Circuit Design Lab at Cal Poly Pomona  
Instructor: Toma Sacco

Disclaimer: These programs are written by me. Feel free to take the code and modify it, however I am not responsible for cheating or plagiarism of any sort. Additionally, refer to LICENSE.

## Prerequisites
  - Tested on linux
    - Ubuntu 18.04 (software buggy on 19.04)
  - Python3
  - Vivado Design Suite 2018.3
  - Xilinx FPGA
    - Using: Nexys A7 - 100T

## Running Vivado
  Note: may require escalated privileges.  
  Run:  
  `source /tools/Xilinx/Vivado/2018.3/settings64.sh && vivado`   
  
  OR   
  Create script:  
  `vim startVivado.sh`    
  Inside script:  
  `#!/bin/bash`  
  `source /tools/Xilinx/Vivado/2018.3/settings64.sh && vivado`  
  
### Note to reader
  Simply cloning the projects no longer works. 
  I have edited .gitignore to only include .v .xdc .bit files
  - .v      :   verilog files
  - .xdc    :   board constraint file
  - .bit    :   bitstream file to simply upload to board
  - .wcfg   :   waveform configuration used for simulation
  - .png    :   capture of waveform simulation
  - .pdf    :   pdf of RTL analysis schematic
