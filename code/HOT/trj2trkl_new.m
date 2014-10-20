function tracklet = trj2trkl_new(X,Y,T)
% be tracked (0 means contine)
% x: x of each trajectory
% y: y of each trajectory
% i=3
% min=10
trknum = 1;
for i = 1:size(X,1)
    tracklet(trknum).x = X(i,:);
    tracklet(trknum).y = Y(i,:);
    tracklet(trknum).t = T(i,:);
    trknum = trknum + 1;
end
end




