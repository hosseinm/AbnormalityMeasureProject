function  [measure_all,P,D] = measure_cell(options,Tracklets_matrix,linear_index,Distance_Matrix)

[P,D] = genarate_cellmatrix( options);
% hot_descriptor1 = zeros(1,options.numbin.*options.number_of_orientation);
measure_all = zeros(1,size(P,1));
for idx=1:size(P,1)
   idx 
Id = Get_Intersecting_NewTracklet( Tracklets_matrix,P(idx,:),D);
measure = AbnormalityMeasure2cell(options , Distance_Matrix , Id ,linear_index);  
measure_all(idx) = measure;
    
end
