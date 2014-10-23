function [ X,Y,T ] = X_Y_matrix(options,data_noisy)

X = zeros(length(data_noisy),options.tracklet_length);
Y = zeros(length(data_noisy),options.tracklet_length);
T = zeros(length(data_noisy),options.tracklet_length);

[~,n] = size(data_noisy);
for i = 1: length(data_noisy)
    for j = 0:n-((n/3)*2)-1
        current_x = data_noisy(i,3*j+1);
        current_y = data_noisy(i,3*j+2);
        current_t = data_noisy(i,3*j+3);
        
        X(i,j+1)=current_x;
        Y(i,j+1)=current_y;
        T(i,j+1)=current_t;
    end
end

 