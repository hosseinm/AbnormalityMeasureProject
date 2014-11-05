function  [measure_all] = AbnormalityMeasure(P,D,options,Tracklets_matrix,linear_index,Distance_Matrix)

measure_all = zeros(1,size(P,1));
for idx=1:size(P,1)
    idx 
    Id = Get_Intersecting_NewTracklet( Tracklets_matrix,P(idx,:),D);
    measure = AbnormalityMeasure2cell(options , Distance_Matrix , Id ,linear_index);  
    measure_all(idx) = measure;
end