function [ num_files_image,filename ] = Function_number_image(FileImage, fileTracklet,i,ImageFormat,name_t,TextName )
%%%%%%%%%%%%%this function get
                  %FileImageTest: file image is into
                  %FileTracklet:  address of train or test file 
                  % num_file:  all folder we have
                  %i :is number of folder
                  %ImageFormat: format of image we are going to read
                  %name: train or test name
                  % by hossein 9/23/2014
                  
                    num_files = length(dir(fullfile(fileTracklet,TextName)));
                    dirlist =dir(fullfile(fileTracklet,TextName));
                    filenames = cell(num_files, 1);
                    filenames{i} = dirlist(i).name;
                    filename1= filenames{i};
                    %% Initialize variables.
                    filename = (fullfile(fileTracklet,filename1));
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%number of frame
                    dirlist1 = dir(fullfile(FileImage,name_t));
                    filenames1 = cell(num_files, 1);
                    filenames1{i} = dirlist1(i).name;
                    filename11= filenames1{i};
                    filename2 = (fullfile(FileImage,filename11));
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%number of frame
                    filename_image = (fullfile(filename2));
                    dirlist2 = dir(fullfile(filename2 ,ImageFormat));
                    num_files_image = length(dirlist2);
end

