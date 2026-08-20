## Introduction to Linear Feedback Shift Registers
Linear Feedback Shift Registers (LFSRs) are sequential digital circuits, which have a combinational feedback system. 
The entire circuit is nothing more than a shift register whose outputs are fed back to the input line, via a XOR operation.
The inputs to the XOR operation depend on a feedback polynomial. The feedback mechanism ensures deterministic yet statistically random-like behavior, making LFSRs widely used in cryptography, digital communications, and test pattern generation.

An n-bit LFSR is defined by its feedback polynomial, often called as the characteristic polynomial, 
  P(x) = c<sub>n</sub>x<sup>n</sup> + c<sub>n-1</sub>x<sup>n-1</sup> + ... + c<sub>1</sub>x<sup>1</sup> + 1.
where c<sub>i</sub> ∈ {0,1} determines if the i-th stage contributes to feedback or not. 
A schematic diagram of the LFSR is shown:- 

<img width="434" height="134" alt="lfsr" src="https://github.com/user-attachments/assets/d0b6796c-8bea-471b-b777-e49ddd8c6ecd" />

More information about LFSRs can be found [here](https://www.geeksforgeeks.org/digital-logic/linear-feedback-shift-registers-lfsr/)

## About the project
In this project, we have developed a four-bit LFSR following the characteristic equation P(x) = x<sup>4</sup> + x<sup>3</sup> + 1. This means, the output of the fourth and third stage (also called as taps) are XORed and the resultant is fed to the input of the LFSR. The initial value of a LFSR is called as a seed. This seed
must never be equal to zero, since if it ever reaches to zero value, the LFSR will enter in a lock state. 

The project is divided into four sections - design of a XOR Gate, design of a D-Flipflop, design of a Shift Register and finally the topmod which combines all the 
sub-modules. 
The XOR Gate (XOR_Gate.v), and the D-Flipflop (D_FF.v) form the edge node of the design - i.e. the final node(s) of the design chain. The Shift Register module (SR.v) is made using the D-Flipflop module. Here, **lfsr_top.v** is not the final top module, but rather, it acts as a wrapper for the LFSR. You will find that the 
entire working and structure of the LFSR is defined in lfsr_top.v , however, this module is again instantiated in the **topmod.v** module. The final module, the topmod.v, includes a clocking wizard ip, which converts a 100MHz clock to 5MHz. This is done so that, when the design is implemented on an FPGA board, we can see the outputs clearly, rather than the output zooming past our eyes in a flash. TestBench for each module is provided along with the proper nomenclature. 

## Output Results

The following is the Elaborated Design of the D-Flipflop 

<img width="994" height="385" alt="DFF" src="https://github.com/user-attachments/assets/a99dc29e-de7a-4e15-9b7c-f3d0e2ac26de" />

The Elaborated Design of the LFSR is shown below
<img width="1023" height="280" alt="Topmod" src="https://github.com/user-attachments/assets/5f479b6f-ba91-4bd9-a314-522baa938358" />

Testbench simulation of lfsr_top.v

<img width="1040" height="229" alt="TestBench" src="https://github.com/user-attachments/assets/d164a58d-f1ee-4231-856c-99d28ad8e614" />

Power Report and Utilization Report respectively

<img width="525" height="298" alt="Power" src="https://github.com/user-attachments/assets/e43e29f2-18b3-4d50-8172-665a3c2de9fe" />

<img width="501" height="245" alt="Implementation" src="https://github.com/user-attachments/assets/239c68a5-2b76-42c9-af65-eff3bf8a5cc7" />

That marks the end of the project. Feel free to use this project as a reference and build your own design. 
Good Ideas should have no borders.







