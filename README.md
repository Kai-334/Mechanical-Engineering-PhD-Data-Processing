# Mechanical Engineering PhD Data Processing

This repository contains MATLAB scripts for processing and analyzing wave propagation data as part of my mechanical engineering PhD research.

## Project Overview

The scripts perform the following tasks:

- Importing data from simulation or experimental results.
- Visualizing raw and filtered wave data.
- Applying digital filters and time-gating.
- Performing 2D Fast Fourier Transform (FFT) analysis.
- Overlaying theoretical dispersion curves.
- Calculating participating factors for different modes.

## File Structure

- `src/`: Contains all MATLAB scripts.
- `data/`: Contains input data files required for the analysis.
- `figures/`: (Optional) Stores generated figures.

```
- your-project/
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

1. Clone the repository.
2. Ensure that MATLAB is installed on your system.
3. Place your data files in the `data/` directory.
4. Run `main_script.m` from the `src/` directory.

## Dependencies

- MATLAB R2020a or later.
- Signal Processing Toolbox.

## Usage

Modify the parameters in `main_script.m` as needed, such as file paths and analysis settings.

## License

This project is licensed under the MIT License.

## Contact

For questions or collaboration, please contact [Sze Kai Low](mailto:lszekai977@gmail,com).
