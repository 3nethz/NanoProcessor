# NanoProcessor
# Simple Processor Design

This repository contains the design and implementation details for a simple processor, focusing on various subcomponents like adders, multiplexers, a program counter, and more. The project is part of a lab exercise to understand and apply digital logic design concepts using VHDL.

![image](https://github.com/user-attachments/assets/3573e16d-cfcc-4968-87a4-1db1f46225dc)


## Project Overview

The primary goal of this project is to design and implement a basic processor that can perform fundamental operations. The design includes:

- **4-bit Add/Subtract Unit:** Handles addition and subtraction operations.
- **3-bit Adder:** Used for various arithmetic operations within the processor.
- **3-bit Program Counter:** Keeps track of the instruction sequence.
- **Multiplexers and Tri-State Buffers:** Manage data flow within the processor.

![image](https://github.com/user-attachments/assets/fc1b3725-381f-4b28-a05b-889d726144e6)


## Components

### 1. 4-bit Add/Subtract Unit
This unit is designed to perform both addition and subtraction on 4-bit binary numbers. The operation is controlled by a mode signal.

### 2. 3-bit Adder
A simple adder that adds two 3-bit numbers and provides the result.

### 3. 3-bit Program Counter
The program counter is responsible for pointing to the next instruction to be executed by the processor. It is a crucial component in sequential instruction execution.

### 4. Multiplexers and Tri-State Buffers
These components are used to control the data flow in the processor, enabling or disabling certain paths as needed.

## VHDL Implementation

The design is implemented using VHDL, with each component described in detail in the corresponding VHDL files. The project emphasizes the use of VHDL constructs to create a functional digital system that can be simulated and synthesized for real-world applications.

## Simulation and Testing

The design has been tested through simulations to verify its correctness. The testbenches used in the simulation are included in the repository. These simulations ensure that the processor's components function as expected.

## How to Use

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/simple-processor-design.git

2. **Navigate to the Project Directory:**
   ```bash
   cd simple-processor-design
3. **Run Simulations:**
    Use your preferred VHDL simulator to run the testbenches provided in the testbench/ directory.

4. **Synthesize the Design:**
    The VHDL files can be synthesized using any compatible FPGA synthesis tool.

 ## Contributors
   
  1. Gamage G.G.T.A.
  2. Ninduwara K.G.M.

  ## Acknowledgements
  This project was developed as part of a laboratory exercise for the Computer Organization and Digital Design at University of Moratuwa. Special thanks to the course instructors for   their guidance.
