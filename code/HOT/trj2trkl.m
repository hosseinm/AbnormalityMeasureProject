function tracklet = trj2trkl(val,x,y,min)
% given : the output of KLT tracker which is a matrix in #feature by #frames
% val:  value of each trajectory, distance of similarity of each point to
% be tracked (0 means contine)
% x: x of each trajectory
% y: y of each trajectory
% i=3
% min=10
[X,Y] = size(val);
trknum = 1;
for i = 1:X
index = find(val(i,:));
    for in = 1:length(index)-1
        if index(in+1)-index(in) > min+1
            tracklet(trknum).x = uint16(x(i,index(in):index(in+1)-1)');
            tracklet(trknum).y = uint16(y(i,index(in):index(in+1)-1)');
            tracklet(trknum).t = (index(in):index(in+1)-1)';
%             tracklet(trknum).ss = [1;1]; % defult as 0 - to be changed later
            trknum = trknum + 1;
        end
        
%         tracklet(trknum).ss = 1;
        
    end
    

    if Y-index(in) > min+1    
        tracklet(trknum).x = uint16(x(i,index(in):end)');
        tracklet(trknum).y = uint16(y(i,index(in):end)');
        tracklet(trknum).t = (index(in):Y)';
%         tracklet(trknum).ss = [1;1];  % defult as 0 - to be changed later
        trknum = trknum + 1;
    end
end

        
