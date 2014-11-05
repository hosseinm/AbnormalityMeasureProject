function [ options ] = Function_cellsize(options )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ImageName=imread(options.Image);
NumGridPixel_cell2=size(ImageName,2)/options.Yinput;
NumGridPixel_cell1=size(ImageName,1)/options.Xinput;
options.NumGridPixel=round((NumGridPixel_cell2+NumGridPixel_cell1)/2);
options.NumGridPixel_x=NumGridPixel_cell1;
options.NumGridPixel_y=NumGridPixel_cell2;
end

