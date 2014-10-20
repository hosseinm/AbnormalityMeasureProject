function [ numgrid ] = Function_Create_Numgrid( options )
ImageName=imread(options.Image);
 [Wim,Him,numimg]=size(ImageName);
    [x,y] = meshgrid(1:options.NumGridPixel:Him,1:options.NumGridPixel:Wim);
    [m,n]=size(x);
    %%% create a matric include number of cell in grid
    for i=1:n
        for j=1:m
            numgrid(j,i)=((i-1)*(m))+j;
        end
    end

end

