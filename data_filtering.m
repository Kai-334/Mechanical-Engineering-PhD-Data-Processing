function Amplitude_Array_filtered = data_filtering(Amplitude_Array, time, order, low_lim, up_lim)
%% Data Filtering Function
% Applies a Butterworth bandpass filter to the amplitude data.
%
% Parameters:
% Amplitude_Array - Matrix of amplitude data.
% time - Time vector in microseconds.
% order - Order of the Butterworth filter.
% low_lim - Lower frequency limit in Hz.
% up_lim - Upper frequency limit in Hz.
%
% Returns:
% Amplitude_Array_filtered - Filtered amplitude data.

    % Calculate sampling frequency
    dt = (time(2) - time(1)) * 1e-6; % Convert microseconds to seconds
    Fs = 1 / dt; % Sampling frequency in Hz

    % Design Butterworth bandpass filter
    [b, a] = butter(order, [low_lim, up_lim] / (Fs / 2));

    % Apply filter
    Amplitude_Array_filtered = filtfilt(b, a, Amplitude_Array);
end
