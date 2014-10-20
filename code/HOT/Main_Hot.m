
%This code is Hot Descriptor code by hossein 10/01/2014 at 4:55 pm :)
%input--------------------------
%max_magnitude_all_cell : max magnitude what have in train dataset for each dataset seaprately
%number_of_orientation  : divide orientation between -pi to pi
%tracklet_length_cell  :tracklet length------ for crowd tracklet it is constant
%numbin_cell  : banch of bin size for quantization---- in fact magnitute divide by this value for quantization
%Xinput,Yinput :S [2x3,4x6,... ] create grid
%OverLaprang   : for creating overlap hot we divide each cell by overlaprange and make more gride (overlaphot)
%datasetcategory  : name of dataset-should change for each dataset we want
%input, output, task ....
addpath('C:\my code\Measure_code\AbnormalityMeasureProject\code\HOT')
options_all;
load('C:\my code\Measure_code\Umn_Tracklet1.mat')
load('C:\my code\Measure_code\mnu_frame_label.mat')
%%%%%%%%%%%%%%%%%%%%%%%%change%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%determaine size of the patch%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ImageName=imread(options.Image); % read a image of dataset); % read a image of dataset
[ options ] = Function_cellsize(options );%%% S [2x3,4x6,... ]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data=Mnu_Tracklet1;
for trkcount=2:2%%% nember of frame(tracklet length)
    for bincount=4:4%%%%%%size of the bin(into cell memory)
        options.tracklet_length=options.tracklet_length_cell(trkcount);%%%%%%% tracklet lenght
        options. numbin=options.numbin_cell(bincount);%%%%%%%number of bin
        options. max_magnitude_all=options.max_magnitude_all_cell(trkcount);%%%% max magnitude in Train video
        data=Mnu_Tracklet1;
        [Feature_Index,label] = Function_Hot_measure(options,TestVideoFile_new,data);
        train_cellbase_measure = Feature_Index;
        train_label = label;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Test
        %         catagory='Test';%%'Train' mut change for train and test(Change)
        %         [Feature_Index] = Function_Hot_measure(catagory,datasetcategory,max_magnitude_all,number_of_orientation,tracklet_length,NumGridPixel,numbin,TestVideoFile_new,Ped1_test);
        %         test_cellbase_measure=Feature_Index;
        %         test_label=label;
        %         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %         pixelnum=2;
        %         FIND_ONE=find(train_label==0);
        %         Start_Test=FIND_ONE(end,1);
        %         %%%%%%%%%%%%%%%%%%%%%%%%%%LDA BW
        %         H=[train;test];
        %         Labels=[train_label;test_label];
    end
end

%%%%%%%%%%%%%%%%%%%%%%%edistance orientation and magnitude%%%%%%%%%
[ M_distance,O_distance ] = Function_distance_O_M( options);

%%%%%%%%%%%%%%%%%%%%%%%%%%Distance Matrix%%%%%%%%%%%%%%%%%%%%%%

[ Distance_Matrix ] = Function_distance_matrix_measure( M_distance,O_distance );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ Label_Bag_Tracklet_All,Bag_Tracklet_All ] = Function_Bag_Tracklet_Mesaure( Feature_Index );
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%distance All Tracklet%%%%%%%%%%%%%
[ Video_Abnormal ] = Function_Compute_AbnormalityMeasure( Feature_Index,Bag_Tracklet_grid,data );

