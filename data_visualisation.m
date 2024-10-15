function data_visualization(Amplitude_Array, time, plot_title)
%% Data Visualization Function
% Visualizes the wave data in 2D and 3D plots.
%
% Parameters:
% Amplitude_Array - Matrix of amplitude data.
% time - Time vector in microseconds.
% plot_title - Title for the plots.

    n = size(Amplitude_Array, 2); % Number of sensing points

    % Top-Down (2D) View of Wave Travel
    figure;
    pcolor(time, 1:n, Amplitude_Array');
    shading flat;
    colormap(flipud(bone));
    colorbar;
    title(['Top-Down (2D) View of Wave Travel - ' plot_title]);
    ylabel('Sensor Numbering (n)');
    xlabel('Time (\mus)');
    set(gcf, 'color', 'w');

    % 3D View of Wave Travel
    figure;
    [X, Y] = meshgrid(time, 1:n);
    s = surf(X', Y', Amplitude_Array);
    s.EdgeColor = 'none';
    xlabel('Time (\mus)');
    ylabel('Sensor Numbering (n)');
    zlabel('Velocity Amplitude (mm/s)');
    title(['3D View of Wave Travel - ' plot_title]);
    colormap(flipud(bone));
    set(gcf, 'color', 'w');
    colorbar;

    % Time series of the first and last channel
    figure;
    sgtitle(plot_title);
    set(gcf, 'color', 'w');

    % First channel
    subplot(2, 1, 1);
    plot(time, Amplitude_Array(:, 1));
    title('First Channel');
    ylabel('Velocity Amplitude (mm/s)');
    xlabel('Time (\mus)');
    grid on;

    % Last channel
    subplot(2, 1, 2);
    plot(time, Amplitude_Array(:, end));
    title('Last Channel');
    ylabel('Velocity Amplitude (mm/s)');
    xlabel('Time (\mus)');
    grid on;
end
