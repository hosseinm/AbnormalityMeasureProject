addpath('C:\my code\Measure_code\AbnormalityMeasureProject\code\HOT')
options_all;
load('C:\my code\Measure_code\Umn_Tracklet1.mat')
load('C:\my code\Measure_code\mnu_frame_label.mat')
%%%%%%%%%%%%%%%%%%%%%%%%change%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%determaine size of the patch%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ImageName=imread(options.Image); % read a image of dataset); % read a image of dataset
[ options ] = Function_cellsize(options);%%% S [2x3,4x6,... ]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data=Mnu_Tracklet1;

        options.tracklet_length=options.tracklet_length_cell(options.trkcount);%%%%%%% tracklet lenght
        options.numbin=options.numbin_cell(options.bincount);%%%%%%%number of bin
        options.max_magnitude_all=options.max_magnitude_all_cell(options.trkcount);%%%% max magnitude in Train video
        data=Mnu_Tracklet1;
        [Feature_Index,label,Feature_Index1] = Function_Hot_measure(options,TestVideoFile_new,data);
        train_cellbase_measure = Feature_Index;
        train_label = label;
%%%%%%%%%%%%%%%%%%%%%%%edistance orientation and magnitude%%%%%%%%%
[ M_distance,O_distance ] = Function_distance_O_M( options);

%%%%%%%%%%%%%%%%%%%%%%%%%%Distance Matrix%%%%%%%%%%%%%%%%%%%%%%

[ Distance_Matrix ] = Function_distance_matrix_measure( M_distance,O_distance );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%[ Label_Bag_Tracklet_All,Bag_Tracklet_All ] = Function_Bag_Tracklet_Mesaure( Feature_Index );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%distance All Tracklet%%%%%%%%%%%%%
[ Video_Abnormal,label1 ] = Function_Compute_AbnormalityMeasure(TestVideoFile_new, Feature_Index,data,options,Distance_Matrix );


% 
% Signal=[];
% for i=1:11
%    Signal=[Signal, Video_Abnormal{i}']; 
% end
% 
% Signal(2,:)=label1';
% signal1=Signal';
