function box = extract_modes_with_displacement(AALamb, SSLamb, num_AS_mode, num_S_mode)
%% Extract Modes with Displacement Function
% Extracts frequency, wavenumber, and displacement data for specified modes.
%
% Parameters:
% AALamb - Cell array containing anti-symmetric mode data.
% SSLamb - Cell array containing symmetric mode data.
% num_AS_mode - Number of anti-symmetric modes to extract.
% num_S_mode - Number of symmetric modes to extract.
%
% Returns:
% box - Cell array containing mode data with displacement.

    box = cell(1, num_AS_mode + num_S_mode);

    % Anti-symmetric modes
    for i = 1:num_AS_mode
        % Load mode displacement data
        mode_name = ['A' num2str(i - 1)]; % Mode names like A0, A1, etc.
        load([mode_name '.mat']); % Loads variables: AALamb, uu

        % Store data
        box{i}{1} = AALamb{i}(:, 1) * 1000; % Frequency in Hz
        box{i}{2} = AALamb{i}(:, 5) * 1000; % Wavenumber in rad/m
        box{i}{3} = uu; % Displacement data
    end

    % Symmetric modes
    for i = 1:num_S_mode
        % Load mode displacement data
        mode_name = ['S' num2str(i - 1)]; % Mode names like S0, S1, etc.
        load([mode_name '.mat']); % Loads variables: SSLamb, uu

        % Store data
        idx = i + num_AS_mode;
        box{idx}{1} = SSLamb{i}(:, 1) * 1000; % Frequency in Hz
        box{idx}{2} = SSLamb{i}(:, 5) * 1000; % Wavenumber in rad/m
        box{idx}{3} = uu; % Displacement data
    end
end
