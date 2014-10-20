function [ Label_Bag_Tracklet_All,Bag_Tracklet_All ] = Function_Bag_Tracklet_Mesaure( Feature_Index )
Bag_Tracklet_All=[];
Label_Bag_Tracklet_All=[];
for trnumvideo=1: size(Feature_Index,1)
    for trnumframe=1:size(Feature_Index,2)
        Bag_Tracklet_All=[Bag_Tracklet_All;Feature_Index{trnumvideo,trnumframe}];
        Label_Bag= zeros(size(Feature_Index{trnumvideo,trnumframe},1),2);
        Label_Bag(1:size(Feature_Index{trnumvideo,trnumframe},1),1)=trnumvideo;
        Label_Bag(1:size(Feature_Index{trnumvideo,trnumframe},1),2)=trnumframe;
        Label_Bag_Tracklet_All=[Label_Bag_Tracklet_All;Label_Bag];
    end
end

end

