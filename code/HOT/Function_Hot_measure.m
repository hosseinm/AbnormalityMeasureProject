function [Feature_Index,label,Feature_Index1] = Function_Hot_measure(options,TestVideoFile_new,data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Train
addpath('C:\my code\Vl_feat\vlfeat-0.9.18\toolbox')
vl_setup;
addpath('C:\my code\libsvm-3.17\matlab')
addpath('C:\my code\pwmetric')
ImageName=imread(options.Image);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Hot feature
cellbase=[];
label=[];
% Feature_Index=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  num_files = length(dir(fullfile(options.Image,strcat(catagory,'**'))));
for i=1:11%num_files
    disp(['processing video... '  num2str(i)])
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%HOT
%     [ num_files_image,filename ] = Function_number_image(FileImage, FileTracklet,i,ImageFormat,NameTestorTrain,TextName );
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     tracklet_all=data{i} ;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for trkstart=1:(data{i}(end,end)-options.tracklet_length) %%max(tracklet(end))
        [ X,Y,T ] = X_Y_matrix( tracklet_all,trkstart);
         %%%%%%%%%%%%%%%%%%noise
        [ X,Y,T ] = NoiseTracklet( X,Y,T );
        tracklet = trj2trkl_new(X,Y,T);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         [ numgrid ] = Function_Create_Numgrid( options );%%%%change pyaramid number
        [ numgridmatrix_x_y ] = Create_Grid(options,tracklet,numgrid);
        [ orientation,magnitude] = make_orientation_magnitude_matrix_frame_measure(numgridmatrix_x_y,tracklet);
        [Index_Magnitude,Index_Magnitude1] = Function_feature_orientation_frame_measure(options,magnitude,orientation);
        Feature_Index{i,trkstart}=Index_Magnitude;
        Feature_Index1{i,trkstart}=Index_Magnitude1;
        label(end+1,:)=TestVideoFile_new{1,i}.gt_frame(1,trkstart);
    end
end
end


