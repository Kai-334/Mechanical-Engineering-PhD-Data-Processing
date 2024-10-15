function box = extract_modes(AALamb, SSLamb, num_AS_mode, num_S_mode)
%% Extract Modes Function
% Extracts frequency and wavenumber data for specified modes.
%
% Parameters:
% AALamb - Cell array containing anti-symmetric mode data.
% SSLamb - Cell array containing symmetric mode data.
% num_AS_mode - Number of anti-symmetric modes to extract.
% num_S_mode - Number of symmetric modes to extract.
%
% Returns:
% box - Cell array containing mode data.

    box = cell(1, num_AS_mode + num_S_mode);

    % Anti-symmetric modes
    for i = 1:num_AS_mode
        mode_data = AALamb{i};
        box{i}{1} = mode_data(:, 1) * 1000; % Frequency in Hz
        box{i}{2} = mode_data(:, 5) * 1000; % Wavenumber in rad/m
    end

    % Symmetric modes
    for i = 1:num_S_mode
        mode_data = SSLamb{i};
        box{i + num_AS_mode}{1} = mode_data(:, 1) * 1000; % Frequency in Hz
        box{i + num_AS_mode}{2} = mode_data(:, 5) * 1000; % Wavenumber in rad/m
    end
end
