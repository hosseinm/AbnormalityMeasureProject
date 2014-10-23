function [measure] = AbnormalityMeasure(rep,bin_all,data,options,Distance_Matrix)

label1=[];
% for i=1:size(TestVideoFile_new,2)%video

AbnormalityMeasureForBlock=[];

for j=1:size(TestVideoFile_new{i}.gt_frame,2)-11
    
    disp(['processing image... '  num2str(j)])
    Bag_Tracklet_grid=0;
    
    for trkpoint=1:10 %% magnitude length
        
        MeasureForBlock=[];
        
        for Pnum=1:size(options.NumGrid_ptaramid,2)
            
            options.Pnum= Pnum;
            
            [ numgrid,n_xx,m_xx,xx,yy ] = Function_Create_Numgrid_measure( options);% grid size
            %             [r c]=find(Label_Bag_Tracklet_All(:,1)==i&Label_Bag_Tracklet_All(:,2)==j);
            
            for trnum=1:size(bin_all,1)
                X=data{1}( trnum,trkpoint);%%%%after noise tracklet should change all tracklet
                Y=data{2}( trnum,trkpoint );
                T=data{3}( trnum,trkpoint );
                if(T(trnum,1)==j-1)
                    for k =1:m_xx-1 %%length(x)
                        for f = 1:n_xx-1
                            if(X>=xx(k,f) && X<xx(k,f+1)&& Y>=yy(k,f)&&Y<yy(k+1,f))
                                Bag_Tracklet_grid(trnum)=numgrid(k,f);%%mybe cluster table
                            end
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