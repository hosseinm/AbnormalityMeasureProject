function [ Distance_Matrix ] = Function_distance_matrix_measure( M_distance,O_distance )
Index_Hist1=[1:(size(M_distance(:),1)*size(O_distance(:),1))];
Index_Hist=reshape(Index_Hist1,size(M_distance(:),1),size(O_distance(:),1));
for i=1:(size(M_distance(:),1)*size(O_distance(:),1))
    for j=1:(size(M_distance(:),1)*size(O_distance(:),1))
        [r1,c1] =   find(Index_Hist==i);
        [r2,c2] =   find(Index_Hist==j);
        Distance_Matrix(i,j) =   (M_distance(r1)-M_distance(r2))^2 + (O_distance(c1)-O_distance(c2))^2;
    end
end
end

