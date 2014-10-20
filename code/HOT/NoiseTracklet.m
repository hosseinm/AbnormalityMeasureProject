
function [ X,Y,T ] = NoiseTracklet( X,Y,T )
XX=X;
YY=Y;
TT=T;
[m,n] = size(XX);
for i=1:m
    
    rangx(i,1)=abs((X(i,n)-X(i,1)));
    rangy(i,1)=abs(Y(i,n)-Y(i,1));
    rang_xy(i,1)=sqrt(rangx(i,1)^2+ rangy(i,1)^2);
    
end

[m,n] = size(XX);
k=0;
for i = 1 : m
    k=k+1;
    F=sum(X(k,:)).*sum(Y(k,:)).*sum(T(k,:));
    if((rang_xy(i,1)<=1)||(isnan(F)))
        X(k,:)=[];
        Y(k,:)=[];
        T(k,:)=[];
        k=k-1;
    end
end
[m,n] = size(X);
% s=0;
for i = 1 : m
    for j=1 : n
        
        if((X(i,j)<0 || Y(i,j)<0)&&(j~=1))
            X(i,j)=X(i,j-1);
            Y(i,j)=Y(i,j-1);
            
        elseif((X(i,1)==0) || (Y(i,1)==0))
            X(i,j)=1;
            Y(i,j)=1;
            
            % if((isnanX(i,j))||(isnanY(i,j)))
            % X(i,j)=X(i,j-1);
            % Y(i,j)=Y(i,j-1);
            % T(i,j)=T(i,j)+1;
        end
        % T(i,)=[];
        % i=i-1;
        % s=s+1;
    end
end
end






% function [ X,Y,T ] = NoiseTracklet( X,Y,T )
% for i =1:size(X,1)
%     for j=1: size(X,2)
%         
%         if(X(i,j)==1&& j~=1)
%             X(i,j)=X(i,j-1); 
%             
%         elseif(Y(i,j)==1&& j~=1)
%             Y(i,j)=Y(i,j-1);
%             
%         end
%     end
%     end
% [r1 c1]=find(X<=0|Y<=0);
% X(r1,:)=[];
% Y(r1,:)=[];
% T(r1,:)=[];
% 
% for i=1:size(X,1)
%     rangx(i,1)=abs((X(i,end)-X(i,1)));
%     rangy(i,1)=abs(Y(i,end)-Y(i,1));
%     rang_xy(i,1)=sqrt(rangx(i,1)^2+ rangy(i,1)^2); 
% end
% % 
% k=0;
% for i = 1 : size(X,2)
%     k=k+1;
%     F=sum(X(k,:)).*sum(Y(k,:)).*sum(T(k,:));
%     if((rang_xy(i,1)<=5)||(isnan(F)))
%         X(k,:)=[];
%         Y(k,:)=[];
%         T(k,:)=[];
%         k=k-1;
%     end
% end
% % 
% 
% end
% 
% 
% 
% 
% 
% % [r1,c1]= find(X(:)<0);
% %     Idy= find(Y(:)<0);
% %     X(Idx)=X(Idx+1);
% %      Y(Idy)=Y(Idy+1);
% 
%    
% 
% 
% 
% 
