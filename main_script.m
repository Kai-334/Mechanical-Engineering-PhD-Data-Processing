%% Main Script for Data Processing
% This script orchestrates the data processing pipeline for wave propagation analysis.

clc; clear all; close all;

% Set default figure properties
set(0, 'DefaultAxesFontName', 'Times New Roman');
set(groot, 'defaulttextinterpreter', 'latex');

%% Add Paths
% Add the path to the data directory
addpath('../data/');

%% Parameters and Settings
% Name of the file to read from
data_filename = 'V22.mat'; % Include .mat for MATLAB file

% Title for all plots
plot_title = 'Model-1 V1';

% Total thickness of the specimen (only relevant if using thickness-normalized theoretical dispersion curves)
specimen_thickness = 3.2; % Units: mm

% Digital filter parameters
filter_order = 4; % Order of the Butterworth filter
filter_low_lim = 50000; % Lower frequency limit in Hz
filter_up_lim = 2000000; % Upper frequency limit in Hz

% Time-gating parameters
time_interest_start = 0; % Start time in microseconds (us)
time_interest_end_initial = 100; % End time for the first sensor in us
time_interest_end_final = 100; % End time for the last sensor in us

% Spatial discretization
dx = 0.1e-3; % Distance between probe points in meters

% Direction of displacement ('in-plane' or 'out-of-plane')
displacement_direction = 'out-of-plane'; % Adjust as needed

% Number of anti-symmetric and symmetric modes to plot
num_AS_mode = 3; % Number of anti-symmetric modes
num_S_mode = 3; % Number of symmetric modes

%% Import Data
[Amplitude_Array, time] = data_import(data_filename);

%% Visualize Raw Data
data_visualization(Amplitude_Array, time, plot_title);

%% Apply Digital Filter
Amplitude_Array_filtered = data_filtering(Amplitude_Array, time, filter_order, filter_low_lim, filter_up_lim);

%% Visualize Filtered Data
data_visualization(Amplitude_Array_filtered, time, [plot_title ' (Filtered)']);

%% Time-Gating
Amplitude_Array_gated = time_gating(Amplitude_Array_filtered, time, time_interest_start, time_interest_end_initial, time_interest_end_final);

%% Apply Hann Window (Optional)
Amplitude_Array_windowed = apply_hann_window(Amplitude_Array_gated);

%% 2D FFT Analysis
[f, k, y3] = fft_analysis(Amplitude_Array_windowed, time, dx);

%% Plot Theoretical Dispersion Curves
plot_dispersion_curves(f, k, y3, specimen_thickness, num_AS_mode, num_S_mode);

%% Calculate Scaling Matrices
[scale_matrix_ux, scale_matrix_uy] = scaling_matrix(f, k, specimen_thickness, num_AS_mode, num_S_mode);

%% Compute Participating Factor
compute_participating_factor(f, k, y3, scale_matrix_ux, scale_matrix_uy, displacement_direction, plot_title);

fprintf('ANALYSIS COMPLETED!\n');
