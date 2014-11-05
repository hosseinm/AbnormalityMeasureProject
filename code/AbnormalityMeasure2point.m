function  Weight_distance = AbnormalityMeasure2point(Distance_Matrix,hot_descriptor)
Weight_distance=0;
s = nonzeros(hot_descriptor);
if(~isempty(s))
    [~, c1] = find(hot_descriptor>0);
    ind = find((hot_descriptor)==max(s(:)));
    
    Var = sum(s(:))/size(s,1);%%% variance
    Sum1=0;
    for  Wnum=1:size(s,1)
        
        Sum1 = Sum1 + (Distance_Matrix(c1(Wnum),ind(1)) * (abs(hot_descriptor(c1(Wnum))- Var )));
        
    end
    Sum2 = Sum1/(size(s,1)+eps);
    Weight_distance = sqrt(Sum2);
end
