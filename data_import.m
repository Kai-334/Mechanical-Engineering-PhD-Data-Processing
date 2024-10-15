function [Amplitude_Array, time] = data_import(filename)
%% Data Import Function
% Imports data from a .mat file and extracts amplitude arrays and time series.
%
% Parameters:
% filename - Name of the .mat file to import.
%
% Returns:
% Amplitude_Array - Matrix of amplitude data.
% time - Time vector in microseconds.

    % Import the data
    A = importdata(['../data/' filename]);

    % Extract amplitude data assuming even columns contain amplitude data
    num_sensors = size(A, 2) / 2;
    Amplitude_Array = zeros(size(A, 1), num_sensors); % Pre-allocate for speed

    for i = 2:2:size(A, 2)
        Amplitude_Array(:, i / 2) = A(:, i);
    end

    % Flip to ascending order if the sensor numbering is in descending order
    Amplitude_Array = fliplr(Amplitude_Array);

    % Extract the time series and convert to microseconds
    time = A(:, 1) / (1e-6); % Convert seconds to microseconds (us)
end
