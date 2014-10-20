function [ orientation,magnitude] = make_orientation_magnitude_matrix_frame_measure(numgridmatrix_x_y,trk)
%%%%%%%compute  ORIENTATION AND MAGNITUDE
    for i = 1: size(numgridmatrix_x_y,1)
        X=double(trk(1,i).x)';
        Y=double(trk(1,i).y)';
        for j = 1:(size(trk(1,i).t,2)-1)
                magnitude(i,j)=sqrt((X(j)-X(j+1))^2+(Y(j)-Y(j+1))^2);
        
            orientation(i,j)= atan2((Y(j+1)-Y(j)),(X(j+1)-X(j)+eps));
        end
    end  
end


