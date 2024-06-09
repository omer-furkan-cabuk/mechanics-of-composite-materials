% MATLAB Problem 7.1 Solution

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
num_layers = 4;
layer_thickness = thickness / num_layers; % thickness of each layer in mm

% Deformations
epsilon_x_0 = 500e-6;
epsilon_y_0 = 0;
gamma_xy_0 = 0;
kappa_x_0 = 0;
kappa_y_0 = 0;
kappa_xy_0 = 0;

% Layer angles
theta = [0, 90, 90, 0]; % in degrees

% Depth of each layer
z = linspace(-thickness/2, thickness/2, num_layers + 1);

%% (a) Ara Yüzeylerdeki Gerilmeler
for i = 1:num_layers
    Q_bar = transform_Q(Q, theta(i));
    strain_interface = [epsilon_x_0; epsilon_y_0; gamma_xy_0] + z(i) * [kappa_x_0; kappa_y_0; kappa_xy_0];
    stress_interface = Q_bar * strain_interface;
    fprintf('Layer %d interface stress: sigma_x = %.6f, sigma_y = %.6f, tau_xy = %.6f\n', ...
        i, stress_interface(1), stress_interface(2), stress_interface(3));
end

%% (b) Katmanlardaki Gerilme ve Gerilme Dağılımı
z_points = linspace(-thickness/2, thickness/2, 100); % 100 points through the thickness
stress_distribution = zeros(3, length(z_points));

for i = 1:length(z_points)
    z_i = z_points(i);
    layer = find(z_i <= z(2:end) & z_i >= z(1:end-1), 1);
    Q_bar = transform_Q(Q, theta(layer));
    strain_z = [epsilon_x_0; epsilon_y_0; gamma_xy_0] + z_i * [kappa_x_0; kappa_y_0; kappa_xy_0];
    stress_distribution(:, i) = Q_bar * strain_z;
end

% Plotting the stress distribution
figure;
subplot(3,1,1);
plot(z_points, stress_distribution(1, :));
xlabel('Depth (mm)');
ylabel('Sigma_x');
title('Stress distribution through the laminate');

subplot(3,1,2);
plot(z_points, stress_distribution(2, :));
xlabel('Depth (mm)');
ylabel('Sigma_y');

subplot(3,1,3);
plot(z_points, stress_distribution(3, :));
xlabel('Depth (mm)');
ylabel('Tau_xy');

%% (c) Kuvvet ve Moment Sonuçları
N = zeros(3, 1);
M = zeros(3, 1);

for i = 1:num_layers
    z_mid = (z(i) + z(i+1)) / 2;
    Q_bar = transform_Q(Q, theta(i));
    strain_mid = [epsilon_x_0; epsilon_y_0; gamma_xy_0] + z_mid * [kappa_x_0; kappa_y_0; kappa_xy_0];
    stress_mid = Q_bar * strain_mid;
    N = N + stress_mid * layer_thickness * 1e-3; % converting thickness from mm to meters
    M = M + stress_mid * z_mid * layer_thickness * 1e-3; % converting thickness from mm to meters
end

fprintf('Force resultants: N_x = %.6f, N_y = %.6f, N_xy = %.6f\n', N(1), N(2), N(3));
fprintf('Moment resultants: M_x = %.6f, M_y = %.6f, M_xy = %.6f\n', M(1), M(2), M(3));

%% (d) Temel Malzeme Sistemine Göre Ara Yüzeylerdeki Gerilmeler
for i = 1:num_layers
    T = [cosd(theta(i)), sind(theta(i)), 0;
         -sind(theta(i)), cosd(theta(i)), 0;
         0, 0, 1];
    strain_interface_global = [epsilon_x_0; epsilon_y_0; gamma_xy_0] + z(i) * [kappa_x_0; kappa_y_0; kappa_xy_0];
    strain_interface_principal = T * strain_interface_global;
    fprintf('Layer %d interface strain (principal system): epsilon_1 = %.6f, epsilon_2 = %.6f, gamma_12 = %.6f\n', ...
        i, strain_interface_principal(1), strain_interface_principal(2), strain_interface_principal(3));
end

%% (e) Temel Malzeme Sistemine Göre Katmanlardaki Gerilmeler
for i = 1:num_layers
    Q_bar = transform_Q(Q, theta(i));
    T = [cosd(theta(i)), sind(theta(i)), 0;
         -sind(theta(i)), cosd(theta(i)), 0;
         0, 0, 1];
    z_mid = (z(i) + z(i+1)) / 2;
    strain_mid_global = [epsilon_x_0; epsilon_y_0; gamma_xy_0] + z_mid * [kappa_x_0; kappa_y_0; kappa_xy_0];
    stress_mid_global = Q_bar * strain_mid_global;
    stress_mid_principal = T * stress_mid_global;
    fprintf('Layer %d midpoint stress (principal system): sigma_1 = %.6f, sigma_2 = %.6f, tau_12 = %.6f\n', ...
        i, stress_mid_principal(1), stress_mid_principal(2), stress_mid_principal(3));
end

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
