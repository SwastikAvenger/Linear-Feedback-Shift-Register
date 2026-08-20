## Introduction to Linear Feedback Shift Registers
Linear Feedback Shift Registers (LFSRs) are sequential digital circuits, which have a combinational feedback system. 
The entire circuit is nothing more than a shift register whose outputs are fed back to the input line, via a XOR operation.
The inputs to the XOR operation depend on a feedback polynomial. The feedback mechanism ensures deterministic yet statistically random-like behavior, making LFSRs widely used in cryptography, digital communications, and test pattern generation.

An n-bit LFSR is defined by its feedback polynomial, often called as the characteristic polynomial, 
  P(x) = c<sub>n</sub>x<sup>n</sup> + c<sub>n-1</sub>x<sup>n-1</sup> + ... + c<sub>1</sub>x<sup>1</sup> + 1.
where c<sub>i</sub> ∈ {0,1} determines if the i-th stage contributes to feedback or not. More information about LFSRs can be found [here](https://www.geeksforgeeks.org/digital-logic/linear-feedback-shift-registers-lfsr/)

## About the project
In this project, we have developed a four-bit LFSR following the characteristic equation P(x) = x<sup>4</sup> + x<sup>3</sup> + 1. This means, the output of the fourth and third stage (also called as taps) are XORed and the resultant is fed to the input of the LFSR. The initial value of a LFSR is called as a seed. This seed
must never be equal to zero, since if it ever reaches to zero value, the LFSR will enter in a lock state. 

The project is divided into four sections - design of a XOR Gate, design of a D-Flipflop, design of a Shift Register and finally the topmod which combines all the 
sub-modules. 
The XOR Gate (XOR_Gate.v), and the D-Flipflop (D_FF.v) form the edge node of the design - i.e. the final node(s) of the design chain. The Shift Register module (SR.v) is made using the D-Flipflop module. Here, **lfsr_top.v** is not the final top module, but rather, it acts as a wrapper for the LFSR. You will find that the 
entire working and structure of the LFSR is defined in lfsr_top.v , however, this module is again instantiated in the **topmod.v** module. The final module, the topmod.v, includes a clocking wizard ip, which converts a 100MHz clock to 5MHz. This is done so that, when the design is implemented on an FPGA board, we can see the outputs clearly, rather than the output zooming past our eyes in a flash. TestBench for each module is provided along with the proper nomenclature. 

## Output Results

Elaborated Diagram of D-Flipflop <img width="994" height="385" alt="DFF" src="https://github.com/user-attachments/assets/a99dc29e-de7a-4e15-9b7c-f3d0e2ac26de" />

