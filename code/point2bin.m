function bin = point2bin(options,tracklet_m_p,tracklet_o_p)

% magnitude(magnitude>11)=1;

binrange=linspace(0-eps,options.max_magnitude_all,options.numbin+1);

hist_o1([1:options.numbin],[1:options.number_of_orientation])=0;

Index_Hist1=[1:size(hist_o1(:),1)];

Index_Hist=reshape(Index_Hist1,options.numbin,options.number_of_orientation);

%          W=double(trk(i).y(floor(size(trk(i).y,1)/2)))/(size(ImageName,1));%%%%%%%normalization magnitude(camera motion)
%W=double(trk(i).y(floor(size(trk(i).y,2)/2)))/(size(ImageName,1));%%%%%%%normalization magnitude(camera motion)
h=0;
for Odegree=-pi:pi/4:pi-(pi/4)
    h=h+1;
    if((tracklet_o_p>=Odegree && tracklet_o_p<(Odegree+(pi/4)))||tracklet_o_p>=(pi))
        for his_num=1:options.numbin
            if((tracklet_m_p>binrange(his_num) && tracklet_m_p<=binrange(his_num+1))||((his_num==options.numbin)&&( tracklet_m_p>=binrange(his_num+1))))
                ind=find(Index_Hist==Index_Hist(his_num,h));
                A=(Index_Hist==ind);
                Index_Magnitude_one= A(:);
                Index_Magnitude_one_withoutorientation= sum(A,2);
                 Index_Magnitude_one_withoutmagnitude= sum(A,1);
            end
        end
    end
    
end

bin=Index_Magnitude_one(:);
bin1=Index_Magnitude_one_withoutorientation(:);
bin2 = Index_Magnitude_one_withoutmagnitude(:);
end







%
%     [Index_Magnitude,Index_Magnitude1] = Function_feature_orientation_frame_measure(options,magnitude,orientation);
% Feature_Index{i,trkstart}=Index_Magnitude;
% Feature_Index1{i,trkstart}=Index_Magnitude1;
% label(end+1,:)=TestVideoFile_new{1,i}.gt_frame(1,trkstart);