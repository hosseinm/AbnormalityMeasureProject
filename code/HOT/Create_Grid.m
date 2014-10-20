function [ numgridmatrix_x_y] = Create_Grid(options,trk,numgrid )
ImageName=imread(options.Image);
[Wim,Him,numimg]=size(ImageName);
[x,y] = meshgrid(1:options.NumGridPixel:Him,1:options.NumGridPixel:Wim);
[xx,yy] = meshgrid(1:options.NumGridPixel:Him+options.NumGridPixel,1:options.NumGridPixel:Wim+options.NumGridPixel);
[m_xx,n_xx]=size(xx);
for i=1:size(trk,2);
    X=trk(1,i).x';
    Y=trk(1,i).y';
    for j = 1:size(trk(1,i).t,2)
        for k =1:m_xx-1 %%length(x)
            for f = 1:n_xx-1
                
                if(X(j)>=xx(k,f) && X(j)<xx(k,f+1)&& Y(j)>=yy(k,f)&&Y(j)<yy(k+1,f))
                    numgridmatrix_x_y(i,j)=numgrid(k,f);
                    
                end
            end
        end
        
    end
    %         numgridmatrix_x_y(num1,:)=0;
end
end



