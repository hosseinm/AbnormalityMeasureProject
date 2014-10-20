function [TestVideoFile_new]=Function_Test_Label_measure( datasetcategory,trkcount )
if(datasetcategory=='UCSDped2')
    switch trkcount
        case 1
            load label_tracklet_5_ped2
        case 2
            load label_tracklet_10_ped2
        case 3
            load label_tracklet_20_ped2
    end
else
    switch trkcount
        case 1
            load label_tracklet_5_ped1
        case 2
            load label_tracklet_10_ped1
        case 3
            load label_tracklet_20_ped1
    end
end
end

