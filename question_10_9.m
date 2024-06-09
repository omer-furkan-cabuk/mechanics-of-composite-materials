% Verilen malzeme özellikleri
E1 = 38.6e9; % Pa
E2 = 8.27e9; % Pa
G12 = 4.14e9; % Pa
v12 = 0.26;

sigma1T = 1062e6; % Pa
sigma1C = 610e6; % Pa
sigma2T = 31e6; % Pa
sigma2C = 118e6; % Pa
tau12F = 72e6; % Pa

% Tsai-Wu katsayıları
F1 = 1/sigma1T - 1/sigma1C;
F2 = 1/sigma2T - 1/sigma2C;
F11 = 1/(sigma1T * sigma1C);
F22 = 1/(sigma2T * sigma2C);
F66 = 1/(tau12F^2);
F12 = -0.5 * sqrt(F11 * F22);

% Gerilmeler
syms alpha
sigma_x = 3*alpha;
sigma_y = -2*alpha;
tau_xy = 5*alpha;

% Tsai-Wu eşitsizliği
Tsai_Wu = F1 * sigma_x + F2 * sigma_y + F11 * sigma_x^2 + F22 * sigma_y^2 + F66 * tau_xy^2 + 2 * F12 * sigma_x * sigma_y;

% Tsai-Wu eşitsizliğini çözelim
alpha_max = solve(Tsai_Wu == 1, alpha);
alpha_max = double(alpha_max);

% Sonuçları göster
fprintf('Maksimum alpha değeri: %.6f\n', alpha_max);
