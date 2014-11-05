function Tracklets_matrix = Tracklet2matrix(tracklet_ped)
% load(options.dataset_path);
[~,n] = size(tracklet_ped);
for i = 1: length(tracklet_ped)
    for j = 0:n-((n/3)*2)-1
        Tracklets{i}(1,j+1) = tracklet_ped(i,3*j+1);
        Tracklets{i}(2,j+1) = tracklet_ped(i,3*j+2);
        Tracklets{i}(3,j+1) = tracklet_ped(i,3*j+3);
    end
end

Tracklets_matrix = zeros(size(Tracklets,2),Tracklets{end}(end,end)+1);
% Tracklets_matrix_x = zeros(size(Tracklets,2),Tracklets{end}(end,end)+1);
% Tracklets_matrix_y = zeros(size(Tracklets,2),Tracklets{end}(end,end)+1);
for i=1:size(Tracklets,2)
    ind =Tracklets{i}(3,:);
    ind=ind+1;
    Tracklets_matrix(i,ind,1) =Tracklets{i}(1,:);
    Tracklets_matrix(i,ind,2) =Tracklets{i}(2,:);
    %%%optional
%     ind1 =Tracklets{i}(1,:);
%     ind1=ind1+1;
%     Tracklets_matrix_x(i,ind1,1) =Tracklets{i}(2,:);
%     Tracklets_matrix_x(i,ind1,2) =Tracklets{i}(3,:);
%     %%%%%
%     ind2 =Tracklets{i}(2,:);
%     ind2=ind2+1;
%     Tracklets_matrix_y(i,ind2,1) =Tracklets{i}(1,:);
%     Tracklets_matrix_y(i,ind2,2) =Tracklets{i}(3,:);
end
end

    
    