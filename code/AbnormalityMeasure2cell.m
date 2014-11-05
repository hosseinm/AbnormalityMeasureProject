function  measure = AbnormalityMeasure2cell(options , Distance_Matrix , Id ,linear_index)

measure1=zeros(1,options.tracklet_length-1);
% hot_descriptor = zeros(1,options.numbin.*options.number_of_orientation);

for point = 1 : options.tracklet_length-1
    
  hot_descriptor = hist(linear_index(point,Id),1:options.numbin*options.number_of_orientation );
  Weight_distance = AbnormalityMeasure2point(Distance_Matrix,hot_descriptor);
  if(~isempty(Weight_distance))
  measure1(point) =  Weight_distance;
  end
end
 measure = sum(measure1);