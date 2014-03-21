% CONFIG Configuration file for the simulation. Here it is possible to
% define the algorithms and the datasets for performing the simulation, and
% to set any additional required feature (e.g. parallelization of the
% experiments).

%% ALGORITHMS

add_algorithm('B', 'Baseline', @Baseline);
add_algorithm('RN', 'RegularizationNetwork', @RegularizationNetwork);

%% WRAPPERS

% add_wrapper('RN', @ParameterSweep, 2, {'C'}, {'exp'}, [-10 5], [1]);

%% DATASETS

add_dataset('I', 'Iono', 'uci_ionosphere ');

%% PREPROCESSORS

% add_preprocessor('I', @ApplyPca);

%% ADVANCED FEATURES

% Uncomment to enable the corresponding feature
% set_flag('save_results');     % Save the results
% set_flag('generate_pdf');     % Generate a pdf (requires pdflatex
%                                 available on the path.
% set_flag('parallelized');     % Parallelize the experiments over the
%                                 default cluster.
% set_flag('gpu_enabled');      % Enable GPU support (requires CUDA drivers
%                                 installed.
% set_flag('semisupervised');   % Enable semi-supervised testing.

%% OTHER CONFIGURATIONS

% This command can be used to transfer the configuration from one algorithm
% to another.
% transfer_configuration('K-ELM', 'ELM', {'kernel_para'});

% This changes the performance measure for a given task.
% set_performance(Tasks.R, @PerfMse);

% This sets any additional output scripts.
% output_scripts = {'info_gridsearch'};