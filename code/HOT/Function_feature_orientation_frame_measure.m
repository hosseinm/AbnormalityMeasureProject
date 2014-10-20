function [Index_Magnitude,Index_Magnitude1] = Function_feature_orientation_frame_measure(options,magnitude,orientation)
magnitude(magnitude>11)=1;
binrange=linspace(0-eps,options.max_magnitude_all,options.numbin+1);
hist_o1([1:options.numbin],[1:options.number_of_orientation])=0;
    Index_Hist1=[1:size(hist_o1(:),1)];
    Index_Hist=reshape(Index_Hist1,options.numbin,options.number_of_orientation);
for i=1:size(magnitude,1)
%     Index_Magnitude_one=zeros(size(magnitude,2),1);
%          W=double(trk(i).y(floor(size(trk(i).y,1)/2)))/(size(ImageName,1));%%%%%%%normalization magnitude(camera motion)
%         orientation_cell(i)=orientation(i);
%         sum_magnitude(i)=sum(magnitude(i,:))*W;
         W=1;%W=double(trk(i).y(floor(size(trk(i).y,2)/2)))/(size(ImageName,1));%%%%%%%normalization magnitude(camera motion)
%         orientation_cell(i)=orientation(i);
        magnitude(i,:)=magnitude(i,:)*W;
        sum_magnitude(i)=sum(magnitude(i,:))*W;

        %         sum_magnitude(i,k)=max((magnitude(i,:,k)));
        for m_number=1:size(magnitude,2)
%         if (sum_magnitude(i)>0)
            h=0;
            for Odegree=-pi:pi/4:pi-(pi/4)
                h=h+1;
                if((orientation(i,m_number)>=Odegree && orientation(i,m_number)<(Odegree+(pi/4)))||(orientation(i,m_number)>=(pi)))
                    for his_num=1:options.numbin
                        if((magnitude(i,m_number)>binrange(his_num)&&magnitude(i,m_number)<=binrange(his_num+1))||((binrange(his_num+1))==options.numbin)&&(magnitude(i,m_number)>=binrange(his_num+1)))
                             ind=find(Index_Hist==Index_Hist(his_num,h));
                             A=(Index_Hist==ind);
                               Index_Magnitude_one(:,m_number)= A(:);
                                 Index_Magnitude_one_without(:,m_number)= sum(A,2);
                        end
                    end
                end
                
            end
        end
        Index_Magnitude(i,:)=Index_Magnitude_one(:);
        Index_Magnitude1(i,:)=Index_Magnitude_one_without(:);
end

end


