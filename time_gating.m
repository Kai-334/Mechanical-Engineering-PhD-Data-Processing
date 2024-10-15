function Amplitude_Array_gated = time_gating(Amplitude_Array, time, start_time, end_time_initial, end_time_final)
%% Time-Gating Function
% Applies time gating to the amplitude data to focus on the region of interest.
%
% Parameters:
% Amplitude_Array - Matrix of amplitude data.
% time - Time vector in microseconds.
% start_time - Start time in microseconds.
% end_time_initial - End time for the first sensor in microseconds.
% end_time_final - End time for the last sensor in microseconds.
%
% Returns:
% Amplitude_Array_gated - Time-gated amplitude data.

    n = size(Amplitude_Array, 2); % Number of sensors
    dt = (time(2) - time(1)); % Time step in microseconds

    % Initialize gated array
    Amplitude_Array_gated = Amplitude_Array;

    % Calculate the slope for linear change in cutoff time
    slope = (end_time_final - end_time_initial) / (n - 1);

    % Apply time gating for each sensor
    for i = 1:n
        % Calculate cutoff time for each sensor
        end_time = end_time_initial + (i - 1) * slope;

        % Find sample indices
        sample_start = round((start_time - time(1)) / dt) + 1;
        sample_end = round((end_time - time(1)) / dt) + 1;

        % Zero out data outside the region of interest
        Amplitude_Array_gated(1:sample_start - 1, i) = 0;
        Amplitude_Array_gated(sample_end + 1:end, i) = 0;
    end

    % Optionally, truncate the data after the maximum end time
    max_sample_end = round((end_time_final - time(1)) / dt) + 1;
    Amplitude_Array_gated = Amplitude_Array_gated(1:max_sample_end, :);
end
