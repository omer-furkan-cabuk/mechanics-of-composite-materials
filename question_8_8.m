% MATLAB Problem 8.8 Solution

% Elastic constants from Problem 2.7
E1 = 50.0e9; % Longitudinal modulus in Pa
E2 = 15.20e9; % Transverse modulus in Pa
G12 = 4.70e9; % Shear modulus in Pa
v12 = 0.254; % Poisson's ratio

% Calculate the Q matrix
Q11 = E1 / (1 - v12^2 * (E2 / E1));
Q12 = v12 * E2 / (1 - v12^2 * (E2 / E1));
Q22 = E2 / (1 - v12^2 * (E2 / E1));
Q66 = G12;

Q = [Q11, Q12, 0;
     Q12, Q22, 0;
     0, 0, Q66];

% Laminate properties
thickness = 0.600; % total thickness in mm
num_layers = 3;
layer_thickness = thickness / num_layers; % thickness of each layer in mm

% Layer angles
theta = [45, 0, -30]; % in degrees

% Depth of each layer
z = linspace(-thickness/2, thickness/2, num_layers + 1);

% Initialize [A], [B], and [D] matrices
A = zeros(3, 3);
B = zeros(3, 3);
D = zeros(3, 3);

%% Calculate [A], [B], and [D] matrices
for i = 1:num_layers
    z_i = z(i);
    z_i1 = z(i+1);
    Q_bar = transform_Q(Q, theta(i));
    
    A = A + Q_bar * (z_i1 - z_i);
    B = B + Q_bar * (z_i1^2 - z_i^2) / 2;
    D = D + Q_bar * (z_i1^3 - z_i^3) / 3;
end

% Display results
disp('A matrix:');
disp(A);

disp('B matrix:');
disp(B);

disp('D matrix:');
disp(D);

%% Function definitions
function Q_bar = transform_Q(Q, theta)
    m = cosd(theta);
    n = sind(theta);
    T = [m^2, n^2, 2*m*n;
         n^2, m^2, -2*m*n;
         -m*n, m*n, m^2 - n^2];
    T_inv = inv(T);
    Q_bar = T_inv * Q * T_inv';
end
