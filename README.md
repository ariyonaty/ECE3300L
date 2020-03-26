# ECE3300L
Work for ECE3300L - Digital Circuit Design Lab at Cal Poly Pomona  
Instructor: Toma Sacco

Disclaimer: These programs are written by me. Feel free to take the code and modify it, however I am not responsible for cheating or plagiarism of any sort.


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


### MIT License
Copyright 2020 Ari Yonaty

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
End license text.
