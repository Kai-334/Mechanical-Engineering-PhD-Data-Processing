function plot_dispersion_curves(f, k, y3, thickness, num_AS_mode, num_S_mode)
%% Plot Dispersion Curves Function
% Overlays theoretical dispersion curves onto the FFT result.
%
% Parameters:
% f - Frequency vector in Hz.
% k - Wavenumber vector in rad/m.
% y3 - 2D FFT amplitude matrix.
% thickness - Thickness of the specimen in mm.
% num_AS_mode - Number of anti-symmetric modes to plot.
% num_S_mode - Number of symmetric modes to plot.

    % Load theoretical dispersion data
    % Adjust the path and filenames as needed
    addpath('../data/');

    % Load material data (adjust as necessary)
    load('IM7_977[00].mat');

    % Extract mode data
    box = extract_modes(AALamb, SSLamb, num_AS_mode, num_S_mode);

    % Plot the FFT result
    figure;
    imagesc(f / 1000, k, (y3').^1);
    set(gca, 'YDir', 'normal');
    axis([0 2000 0 7000]);
    colorbar;
    shading flat;
    xlabel('Frequency [kHz]');
    ylabel('Wavenumber [rad/m]');
    title('FFT Result with Theoretical Dispersion Curves');
    colormap(flipud(bone));
    set(gcf, 'color', 'w');
    hold on;

    % Plot theoretical dispersion curves
    % Anti-symmetric modes in blue, symmetric modes in red
    for i = 1:num_AS_mode
        plot(box{i}{1} / 1000, box{i}{2}, 'b'); % Convert frequency to kHz
    end
    for i = num_AS_mode+1:num_AS_mode+num_S_mode
        plot(box{i}{1} / 1000, box{i}{2}, 'r'); % Convert frequency to kHz
    end
    hold off;
    legend('FFT Amplitude', 'Anti-symmetric Modes', 'Symmetric Modes');

    rmpath('../data/');
end
