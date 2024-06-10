# Mechanics of Composite Materials with MATLAB

## Introduction

This project involves the study and implementation of various mechanics of composite materials using MATLAB. The primary goal is to utilize MATLAB as a matrix calculator for performing the necessary numerical calculations in the mechanics of composite materials. This project emphasizes step-by-step solutions to mechanical problems, enhancing the understanding of composite material mechanics computations.

The MATLAB scripts provided in this repository are based on the book "Mechanics of Composite Materials with MATLAB" by George Z. Voyiadjis and Peter I. Kattan. The book focuses on linear elastic behavior in structural mechanics and includes a variety of examples and problems solved using MATLAB.

## Project Overview

The project includes MATLAB functions specifically written to analyze fiber-reinforced composite materials. The functions are designed to handle various tasks such as calculating compliance and stiffness matrices, lamina analysis in local and global coordinate systems, and failure theories of a lamina.

### Key Features

1. **Comprehensive MATLAB Functions**: The project includes 44 special MATLAB functions provided as M-files, which are used to perform calculations specific to the mechanics of composite materials.
2. **Step-by-Step Problem Solving**: Each problem is solved in a detailed manner, focusing on understanding the mechanics computations rather than just providing ready-made solutions.
3. **Interactive MATLAB Sessions**: The MATLAB examples are conducted in the form of interactive sessions, allowing users to follow along and understand each step of the computation.
4. **Educational Focus**: The project is designed primarily for students and professionals interested in learning the mechanics of composite materials through practical MATLAB implementations.

## Project Structure

The project is organized into several key sections:

1. **MATLAB Functions**: A comprehensive set of MATLAB functions used throughout the project.
2. **Examples**: Detailed examples demonstrating both the theory and numerical computations.
3. **Problems and Solutions**: A series of problems provided at the end of each chapter, with solutions to reinforce learning.

---

### Adding Project Visuals

To add visual representations and figures related to the project, please include your images in the `images` directory of this repository and reference them in the appropriate sections of this README.

---

## MATLAB Functions and Code Structure

### Compliance and Stiffness Matrices

The MATLAB functions included in this project are used to calculate the compliance and stiffness matrices for orthotropic, transversely isotropic, and isotropic materials. Below are some of the key functions and their descriptions:

- **OrthotropicCompliance**: Calculates the compliance matrix for orthotropic materials.
- **OrthotropicStiffness**: Calculates the stiffness matrix for orthotropic materials.
- **TransverselyIsotropicCompliance**: Calculates the compliance matrix for transversely isotropic materials.
- **TransverselyIsotropicStiffness**: Calculates the stiffness matrix for transversely isotropic materials.
- **IsotropicCompliance**: Calculates the compliance matrix for isotropic materials.
- **IsotropicStiffness**: Calculates the stiffness matrix for isotropic materials.

```matlab
function y = OrthotropicCompliance(E1, E2, E3, NU12, NU23, NU13, G12, G23, G13)
    %OrthotropicCompliance This function returns the compliance matrix
    % for orthotropic materials. There are nine
    % arguments representing the nine independent
    % material constants. The size of the compliance
    % matrix is 6 x 6.
    y = [1/E1 -NU12/E1 -NU13/E1 0 0 0 ; -NU12/E1 1/E2 -NU23/E2 0 0 0 ;
         -NU13/E1 -NU23/E2 1/E3 0 0 0 ; 0 0 0 1/G23 0 0 ; 0 0 0 0 1/G13 0 ;
         0 0 0 0 0 1/G12];
end
