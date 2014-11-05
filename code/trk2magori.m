function [trk_magnitude,trk_orientation] = trk2magori(data)

% X = data{1};
% Y = data{2};
% T = data{3};


magx = data(:,4:3:end-2) - data(:,1:3:end-5);
magy = data(:,5:3:end-1) - data(:,2:3:end-4);
trk_magnitude = sqrt(magx.^2 + magy.^2);
trk_orientation = atan2(magy, magx+eps);


% magx = X(:,2:end) - X(:,1:end-1);
% magy = Y(:,2:end) - Y(:,1:end-1);
% trk_magnitude = sqrt(magx.^2 + magy.^2);
% trk_orientation = atan2(magy, magx+eps);