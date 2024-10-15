function compute_participating_factor(f, k, y3, scale_matrix_ux, scale_matrix_uy, displacement_direction, plot_title)
%% Compute Participating Factor Function
% Calculates the participating factor and plots the results.
%
% Parameters:
% f - Frequency vector in Hz.
% k - Wavenumber vector in rad/m.
% y3 - 2D FFT amplitude matrix.
% scale_matrix_ux - Scaling matrix for in-plane displacement.
% scale_matrix_uy - Scaling matrix for out-of-plane displacement.
% displacement_direction - Direction of displacement ('in-plane' or 'out-of-plane').
% plot_title - Title for the plots.

    % Apply scaling matrix
    if strcmp(displacement_direction, 'in-plane')
        y4 = y3(1:size(scale_matrix_ux, 1), 1:size(scale_matrix_ux, 2)) .* scale_matrix_ux;
    else
        y4 = y3(1:size(scale_matrix_uy, 1), 1:size(scale_matrix_uy, 2)) .* scale_matrix_uy;
    end

    % Plot the scaled FFT result
    figure;
    imagesc(f / 1000, k, abs(y4'));
    set(gca, 'YDir', 'normal');
    colorbar;
    shading flat;
    xlabel('Frequency (kHz)');
    ylabel('Wavenumber (rad/m)');
    title([plot_title ' (Scaled)']);
    colormap(flipud(bone));
    set(gcf, 'color', 'w');

    % 3D Surface Plot
    y4(y4 == 0) = NaN;
    [F_grid, K_grid] = meshgrid(f / 1000, k);

    figure;
    surf(F_grid, K_grid, abs(y4'));
    xlabel('Frequency (kHz)');
    ylabel('Wavenumber (rad/m)');
    zlabel('Magnitude');
    title([plot_title ' (Scaled)']);
    colormap(flipud(bone));
    set(gcf, 'color', 'w');
    colorbar;
    view(2);
end
