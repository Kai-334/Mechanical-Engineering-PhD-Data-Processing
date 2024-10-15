# Mechanical Engineering PhD Data Processing

This repository contains MATLAB scripts for processing and analyzing wave propagation data as part of my mechanical engineering PhD research.

## Project Overview

The scripts perform the following tasks:

- Data Importing: Reading and preprocessing raw acoustic emission data from simulations or experiments.
- Data Visualization: Visualizing raw and filtered wave data in both time-space and frequency-wavenumber domains.
- Signal Processing: Applying digital filters and time-gating to enhance signal quality and focus on regions of interest.
- FFT Analysis: Performing 2D Fast Fourier Transform (FFT) analysis to convert time-space data into frequency-wavenumber representations.
- Dispersion Curve Overlay: Overlaying theoretical dispersion curves onto FFT results for comparison and validation.
- Participating Factor Calculation: Calculating participating factors for different wave modes to quantify their contributions.

## File Structure

- `src/`: Contains all MATLAB scripts.
- `data/`: Contains input data files required for the analysis.
- `figures/`: (Optional) Stores generated figures.

```
- data-analysis-project/
  - README.md
  - src/
    - main_script.m
    - data_import.m
    - data_visualization.m
    - data_filtering.m
    - time_gating.m
    - apply_hann_window.m
    - fft_analysis.m
    - plot_dispersion_curves.m
    - extract_modes.m
    - extract_modes_with_displacement.m
    - scaling_matrix.m
    - compute_participating_factor.m
  - data/
    - V22.mat
    - A0.mat
    - S0.mat
    - (other .mat files)
  - figures/
    - (optional: save generated figures here)
```

## Getting Started

1. Clone the repository:
   git clone https://github.com/yourusername/data-analysis-project.git
3. Ensure that MATLAB is installed on your system.
4. Place your data files in the `data/` directory.
5. Run `main_script.m` from the `src/` directory.

## Dependencies

- MATLAB R2020a or later.
- Signal Processing Toolbox.

## Usage

Modify the parameters in `main_script.m` as needed, such as file paths and analysis settings.

## License

This project is licensed under the MIT License.

## Contact

For questions or collaboration, please contact [Sze Kai Low](mailto:lszekai977@gmail,com).
