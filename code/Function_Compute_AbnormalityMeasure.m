function [ Video_Abnormal,label1 ] = Function_Compute_AbnormalityMeasure(TestVideoFile_new, Feature_Index,data,options,Distance_Matrix )
% tracklet_length_cell=[5,11,21];
% NumGrid_ptaramid = [1];
% tracklet_length=tracklet_length_cell(trkcount);
%Cluster_Matrix  =  dist2(Cluster_center, Cluster_center);
label1=[];
for i=1:size(TestVideoFile_new,2)%video
    AbnormalityMeasureForBlock=[];
    for j=1:size(TestVideoFile_new{i}.gt_frame,2)-11
           disp(['processing video... '  num2str(j)])
        Bag_Tracklet_grid=0;
        for trkpoint=1:10 %% magnitude length
        MeasureForBlock=[];
            for Pnum=1:size(options.NumGrid_ptaramid,2)
               options.Pnum= Pnum;
                [ numgrid,n_xx,m_xx,xx,yy ] = Function_Create_Numgrid_measure( options);% grid size
                %             [r c]=find(Label_Bag_Tracklet_All(:,1)==i&Label_Bag_Tracklet_All(:,2)==j);
                
                for trnum=1:size(Feature_Index{i,j},1)
                    % X=Ped1_test{i,j}( trnum  ,(((j+(floor((tracklet_length)/2)))*3)+1));%%%%after noise tracklet should change all tracklet
                    % Y=Ped1_test{i,j}( trnum  ,(((j+(floor((tracklet_length)/2)))*3)+2));
                    X=data{i}( trnum  ,((trkpoint-1)*3)+1);%%%%after noise tracklet should change all tracklet
                    Y=data{i}( trnum  ,((trkpoint-1)*3)+2);
                    for k =1:m_xx-1 %%length(x)
                        for f = 1:n_xx-1
                            if(X>=xx(k,f) && X<xx(k,f+1)&& Y>=yy(k,f)&&Y<yy(k+1,f))
                                Bag_Tracklet_grid(trnum)=numgrid(k,f);%%mybe cluster table
                            end
                        end
                    end
                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                cluster_size=(options.numbin*options.number_of_orientation);
                DD=single(Feature_Index{i,j}(:,[((trkpoint-1)*cluster_size)+1:((trkpoint)*cluster_size)]));
                %             DD_Hist=sum(DD(:,[1:cluster_size]));
                for g=1:size(numgrid(:),1)
                    iB=find(Bag_Tracklet_grid==g);
                    iC=iB';
                    if(~isempty(iC))
                        h(g,:)=sum(DD(iC,:),1);
                    else
                        h(g,:)=zeros(1,size(DD,2));
                    end
                end
                %%%%%%%%%%%%%%%%%%%%%%
                Weight_distance=0;
                for g=1:size(numgrid(:),1)
                    s = nonzeros((h(g,:)));
                    if(~isempty(s))
                        [r1, c1] = find(h(g,:)>0);
                        ind = find((h(g,:))==max(s(:)));
                        
                        Var(g) = sum(s(:))/size(s,1);%%% variance
                        Sum=0;
                        for  Wnum=1:size(s,1)
                            
                            Sum  =  Sum  +    (Distance_Matrix(c1(Wnum),ind(1)) * (abs(h(g,c1(Wnum))-Var(g))));
                            
                        end
                        Sum2=Sum/(size(s,1)+eps);
                        Weight_distance(g)=sqrt(Sum2);
                    end
                end
        
               
                MeasureForBlock=[MeasureForBlock,Weight_distance(:)'];
            end
            MeasureForBlock1(trkpoint,:)=MeasureForBlock;
        end
        AbnormalityMeasureForBlock(j,:)=sum(MeasureForBlock1,1);
    end
    Video_Abnormal{i}=AbnormalityMeasureForBlock;
    label1=[label1,TestVideoFile_new{i}.gt_frame(1,[12:end])];
    end
end

