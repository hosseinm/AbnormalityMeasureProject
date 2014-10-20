function [ numgrid,n_xx,m_xx,xx,yy ] = Function_Create_Numgrid_measure( options)
ImageName=imread(options.Image);
[Wim,Him,~]=size(ImageName);
[x,y] = meshgrid(1:Him/options.NumGrid_ptaramid(options.Pnum):Him,1:Wim/options.NumGrid_ptaramid(options.Pnum):Wim);
[xx,yy] = meshgrid(1:Him/options.NumGrid_ptaramid(options.Pnum):Him+Him/options.NumGrid_ptaramid(options.Pnum),1:Wim/options.NumGrid_ptaramid(options.Pnum):Wim+Wim/options.NumGrid_ptaramid(options.Pnum));
[m_xx,n_xx]=size(xx);
    [m,n]=size(x);
    numgrid=[1:m*n];
    numgrid=reshape(numgrid,m,n);
end
    %%% create a matric include number of cell in grid
%     for i=1:n
%         for j=1:m
%             numgrid(j,i)=((i-1)*(m))+j;
%         end
%     end
% 
% end