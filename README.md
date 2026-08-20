## Introduction to Linear Feedback Shift Registers
Linear Feedback Shift Registers (LFSRs) are sequential digital circuits, which have a combinational feedback system. 
The entire circuit is nothing more than a shift register whose outputs are fed back to the input line, via a XOR operation.
The inputs to the XOR operation depend on a feedback polynomial. The feedback mechanism ensures deterministic yet statistically random-like behavior, making LFSRs widely used in cryptography, digital communications, and test pattern generation.

An n-bit LFSR is defined by its feedback polynomial, often called as the characteristic polynomial, 
  P(x) = c<sub>n<sub>

[here](https://www.geeksforgeeks.org/digital-logic/linear-feedback-shift-registers-lfsr/)
