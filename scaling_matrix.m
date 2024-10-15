function [scale_matrix_ux, scale_matrix_uy] = scaling_matrix(f, k, thickness, num_AS_mode, num_S_mode)
%% Scaling Matrix Function
% Calculates the scaling matrices for in-plane and out-of-plane displacement components.
%
% Parameters:
% f - Frequency vector in Hz.
% k - Wavenumber vector in rad/m.
% thickness - Thickness of the specimen in mm.
% num_AS_mode - Number of anti-symmetric modes.
% num_S_mode - Number of symmetric modes.
%
% Returns:
% scale_matrix_ux - Scaling matrix for in-plane displacement.
% scale_matrix_uy - Scaling matrix for out-of-plane displacement.

    % Load necessary data (adjust the path and filenames as needed)
    addpath('../data/');
    load('IM7_977[00].mat');

    % Extract modes with displacement data
    box = extract_modes_with_displacement(AALamb, SSLamb, num_AS_mode, num_S_mode);

    % Initialize scaling matrices
    scale_matrix_ux = zeros(length(f), length(k));
    scale_matrix_uy = zeros(length(f), length(k));

    % Calculate scaling factors and matrices
    for i = 1:length(box)
        % Extract mode data
        freq = box{i}{1}; % Frequency in Hz
        wavenumber = box{i}{2}; % Wavenumber in rad/m
        uu = box{i}{3}; % Displacement data

        % Calculate scaling factors
        scale_factor_ux = medfilt1(1 ./ (uu(:, 1) * 1000 .* (2 * pi * freq)), 3);
        scale_factor_uy = medfilt1(1 ./ (uu(:, 2) * 1000 .* (2 * pi * freq)), 3);

        % Discretize to match FFT grid
        [~, iff] = arrayfun(@(x) min(abs(f - x)), freq);
        [~, ikk] = arrayfun(@(x) min(abs(k - x)), wavenumber);

        % Populate scaling matrices
        for j = 1:length(freq)
            scale_matrix_ux(iff(j), ikk(j)) = scale_factor_ux(j);
            scale_matrix_uy(iff(j), ikk(j)) = scale_factor_uy(j);
        end
    end

    rmpath('../data/');

    % Plot scaling matrices (optional)
    figure;
    imagesc(f / 1000, k, abs(scale_matrix_uy'));
    set(gca, 'YDir', 'normal');
    colorbar;
    shading flat;
    xlabel('Frequency (kHz)');
    ylabel('Wavenumber (rad/m)');
    title('Out-of-Plane Scaling Matrix');
    colormap(flipud(bone));
    set(gcf, 'color', 'w');

    figure;
    imagesc(f / 1000, k, abs(scale_matrix_ux'));
    set(gca, 'YDir', 'normal');
    colorbar;
    shading flat;
    xlabel('Frequency (kHz)');
    ylabel('Wavenumber (rad/m)');
    title('In-Plane Scaling Matrix');
    colormap(flipud(bone));
    set(gcf, 'color', 'w');
end
