function Amplitude_Array_windowed = apply_hann_window(Amplitude_Array)
%% Apply Hann Window Function
% Applies a Hann window across the spatial domain at all points in time.
%
% Parameters:
% Amplitude_Array - Matrix of amplitude data.
%
% Returns:
% Amplitude_Array_windowed - Windowed amplitude data.

    n = size(Amplitude_Array, 2); % Number of sensors

    % Generate Hann window
    w = hann(n, 'periodic')';

    % Apply window to each time point
    Amplitude_Array_windowed = Amplitude_Array .* w;
end
