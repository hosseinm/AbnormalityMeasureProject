%% addpath, set parameters, load data
addpath('HOT');
cdw = cd;
addpath(cdw);

% Parameter setting
slash = '/';
if ispc
    slash = '\';
end;

%% Options
options_AbnormalityMeasure;
options = Function_cellsize(options);%%% S [2x3,4x6,... ]
options.tracklet_length = 11;
options.numbin = 16;
options.max_magnitude_all= 28;
%
[ M_distance,O_distance ] = Function_distance_O_M(options);
[ Distance_Matrix ] = Function_distance_matrix_measure( M_distance,O_distance );

%% Data load
%clear all
load(['..',slash,'data',slash,'input',slash,'mnu_frame_label.mat']);
load(['..',slash,'data',slash,'input',slash,'Umn_Tracklet1.mat'],'Mnu_Tracklet1');
data_noisy_mat = Mnu_Tracklet1;

%% Method
seq = 1; %size(data,2)
[data_noisy{1},data_noisy{2},data_noisy{3}] = X_Y_matrix(options,data_noisy_mat{seq});
data = rm_noisy_trk(options, data_noisy);
[trk_magnitude,trk_orientation] = trk2magori(data);

bin_all = seq2bin(options,trk_magnitude,trk_orientation);

rep = trk2rep(options,data); % for 1-d

[measure] = AbnormalityMeasure(rep,bin_all,data,options,Distance_Matrix);
%[ Video_Abnormal,label1 ] = Function_Compute_AbnormalityMeasure(TestVideoFile_new, Feature_Index,data,options,Distance_Matrix );


%% Evaluation


