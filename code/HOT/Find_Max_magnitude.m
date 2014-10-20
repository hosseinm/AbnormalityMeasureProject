function [Max_value_test] = Find_Max_magnitude(num_files,dirlist,tracklet_length,NumGridPixel,number_of_orientation,FileTrackletTrain,FileImageTest,NameTrainFolder,ImageFormat,ImageName)
  numbin=3;%value is not important
  max_magnitude_all=21.5;%value is not important
    for i=1:num_files
        filenames{i} = dirlist(i).name;
        filename1= filenames{i};
        %% Initialize variables.
        filename = (fullfile(FileTrackletTrain,filename1));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%number of frame
        dirlist1 = dir(fullfile(FileImageTest,NameTrainFolder));
        filenames1 = cell(num_files, 1);
        filenames1{i} = dirlist1(i).name;
        filename11= filenames1{i};
        filename2 = (fullfile(FileImageTest,filename11));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%number of frame
        filename_image = (fullfile(FileTrackletTrain,filename2));
        dirlist2 = dir(fullfile(filename2 ,ImageFormat));
        num_files_image = length(dirlist2);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [x, y, val] = klt_read_featuretable(filename); %load the output of KLT in tex format
        tracklet1 = trj2trkl(val,x,y,tracklet_length+1);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Tracklet_all= tracklet1;%%%%%%%%%%%input of tracklet file as struct exactly like this 'tracklet_all(1,numtext).num'
%         image1=imread('ped1.tif');
%         ImageName=image1;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for trkstart=1:(num_files_image-tracklet_length) %%max(tracklet(end))
            [Wim,Him,numimg]=size(ImageName);
            [x,y] = meshgrid(1:NumGridPixel:Him,1:NumGridPixel:Wim);
            [xx,yy] = meshgrid(1:NumGridPixel:Him+NumGridPixel,1:NumGridPixel:Wim+NumGridPixel);
            [m_xx,n_xx]=size(xx);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [trk ] = Function_X_Y_for_each_frame(tracklet1,trkstart,tracklet_length );%%%% extract X,Y,T for frame
            [ numgrid ] = Function_Create_Numgrid( ImageName,NumGridPixel);
            [ numgridmatrix_x_y ] = Create_Grid(trk,NumGridPixel,ImageName,numgrid);
            [orientation,magnitude] = make_orientation_magnitude_matrix_frame(numgridmatrix_x_y,trk,numgrid);
            [~,~,Max_value,~] = Function_feature_orientation_frame(magnitude,orientation,number_of_orientation,numgrid,trk,max_magnitude_all,numbin);
            Max_value_test(trkstart,i)=Max_value;
        end
    end

end

