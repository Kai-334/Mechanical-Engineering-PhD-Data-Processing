function [f, k, y3] = fft_analysis(Amplitude_Array, time, dx)
%% 2D FFT Analysis Function
% Performs 2D FFT on the amplitude data and computes the frequency and wavenumber vectors.
%
% Parameters:
% Amplitude_Array - Matrix of amplitude data.
% time - Time vector in microseconds.
% dx - Spatial discretization in meters.
%
% Returns:
% f - Frequency vector in Hz.
% k - Wavenumber vector in rad/m.
% y3 - 2D FFT amplitude matrix.

    dt = (time(2) - time(1)) * 1e-6; % Time step in seconds
    Fs = 1 / dt; % Sampling frequency in Hz

    % Number of samples
    Nt = size(Amplitude_Array, 1);
    Nx = size(Amplitude_Array, 2);

    % Zero padding
    Ntt = 8 * (2^(nextpow2(Nt)));
    Nxx = 20 * (2^(nextpow2(Nx)));

    % Frequency and wavenumber vectors
    f = (1:Ntt/2) * (1 / (Ntt * dt)); % Frequency vector in Hz
    k = ((1:Nxx/2)) * (1 / (Nxx * dx)) * 2 * pi; % Wavenumber vector in rad/m

    % Perform 2D FFT
    y = fft2(Amplitude_Array, Ntt, Nxx);
    y1 = fftshift(y) / numel(Amplitude_Array);
    y2 = abs(y1);
    y3 = 2 * y2(1:(Ntt/2), (Nxx/2+1):Nxx);
    y3 = flipud(y3);

    % Plot the FFT result
    figure;
    i_f = 1:2:length(f);
    i_k = 1:2:length(k);
    imagesc(f(i_f) / 1000, k(i_k), (y3(i_f, i_k)').^1);
    set(gca, 'YDir', 'normal');
    axis([0 2000 0 7000]);
    colorbar;
    shading flat;
    xlabel('Frequency [kHz]');
    ylabel('Wavenumber [rad/m]');
    title('2D FFT Analysis');
    colormap(flipud(bone));
    set(gcf, 'color', 'w');
end
