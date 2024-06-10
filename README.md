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
```

### Example: Linear Elastic Stress-Strain Relations

#### Problem Statement

Consider a 60-mm cube made of graphite-reinforced polymer composite material subjected to a tensile force of 100 kN perpendicular to the fiber direction, directed along the 2-direction. The cube is free to expand or contract. Use MATLAB to determine the changes in the 60-mm dimensions of the cube.

#### Solution

First, the normal stress in the 2-direction is calculated in GPa:

```matlab
sigma2 = 100 / (60 * 60);
sigma = [0 sigma2 0 0 0 0]';
S = OrthotropicCompliance(155.0, 12.10, 12.10, 0.248, 0.458, 0.248, 4.40, 3.20, 4.40);
epsilon = S * sigma;

end
```

Next, the changes in length in each direction are calculated by multiplying the strain by the dimension in each direction:

```matlab

d1 = epsilon(1) * 60;
d2 = epsilon(2) * 60;
d3 = epsilon(3) * 60;

```

### MATLAB Problem 7.1 Explanation

In this problem, a glass-reinforced polymer composite laminate with a total thickness of 0.600 mm, stacked as a [0/90]s laminate, is considered. The four layers of the laminate are of equal thickness and are deformed so that at a point (x, y) on the reference surface, the following strains and curvatures are present:

\[ \epsilon_x^0 = 500 \times 10^{-6} \]
\[ \epsilon_y^0 = \gamma_{xy}^0 = \kappa_x^0 = \kappa_y^0 = \kappa_{xy}^0 = 0 \]

Using MATLAB, the following components were determined:
- The three components of strain at the interface locations.
- The three components of stress in each layer.
- The stress distribution along the depth of the laminate for each component.
- The force and moment resultants in the laminate.
- The three components of strain at the interface locations with respect to the principal material system.
- The three components of stress in each layer with respect to the principal material system.

  ![Composite Material Example](https://github.com/omer-furkan-cabuk/images/7.1.jpeg)


### MATLAB Problem 7.4 Explanation

In this problem, a glass-reinforced polymer composite laminate with a total thickness of 0.900 mm, stacked as a [±30/0]s laminate, is considered. The six layers of the laminate are of equal thickness and are deformed so that at a point (x, y) on the reference surface, the following strains and curvatures are present:

\[ \kappa_x = 2.5 \, \text{m}^{-1} \]
\[ \epsilon_x^0 = \epsilon_y^0 = \gamma_{xy}^0 = \kappa_y^0 = \kappa_{xy}^0 = 0 \]

Using MATLAB, the following components were determined:
- The three components of strain at the interface locations.
- The three components of stress in each layer.
- The stress distribution along the depth of the laminate for each component.
- The force and moment resultants in the laminate.
- The three components of strain at the interface locations with respect to the principal material system.
- The three components of stress in each layer with respect to the principal material system.

### MATLAB Problem 8.8 Explanation

In this problem, a glass-reinforced polymer composite laminate with a total thickness of 0.600 mm, stacked as a [+45/0/−30]T laminate, is considered. The three layers are of equal thickness, and the A, B, and D matrices were calculated.

### MATLAB Problem 10.6 Explanation

In this problem, the maximum value of α > 0 for stresses of σx = 3α, σy = −2α, and τxy = 5α applied to a 30°-lamina of glass/epoxy was determined. The maximum stress failure theory was used to perform the calculations.

### MATLAB Problem 10.9 Explanation

Problem 10.6 was solved using the Tsai-Wu failure theory instead of the maximum stress failure theory.

### Adding Output Visuals

To add visual representations of the output, please include your images in the `output` directory of this repository and reference them in this section.

### Results and Conclusion

The results from the MATLAB computations provide insights into the stress-strain relationships, failure theories, and overall behavior of composite materials under various loading conditions. This project serves as a practical guide for students and professionals to understand and apply the mechanics of composite materials using MATLAB.

By following the examples and utilizing the provided MATLAB functions, users can gain a deeper understanding of the theoretical and practical aspects of composite material mechanics.
