function [ M_distance,O_distance ] = Function_distance_O_M( options)
O_distance1=linspace(0-eps,options.number_of_orientation ,9);
for i=1:size(O_distance1,2)-1
    O_distance(1,i)=(O_distance1(i+1)-O_distance1(1));
end
%magnitude
M_distance1=linspace(0-eps,options.maxmagnitude,options.numbin+1);%%%magnitudes are diffrent
for i=1:size(M_distance1,2)-1
    M_distance(1,i) =   (M_distance1(i+1)-M_distance1(1));
end
end
