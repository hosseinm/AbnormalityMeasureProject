function [ X,Y,T ] = X_Y_matrix( tracklet_all,trkstart)
% % %  create X and Y matrix

[r,c]= (find(tracklet_all(:,3)==(trkstart-1)));
trk=tracklet_all(r,:);
[m,n] = size(trk);
for i = 1: length(trk)
    for j = 0:n-((n/3)*2)-1
        current_x = trk(i,3*j+1);
        current_y = trk(i,3*j+2);
          current_t = trk(i,3*j+3);
        X(i,j+1)=current_x;
        Y(i,j+1)=current_y;
        T(i,j+1)=current_t;
    end
end

end

 