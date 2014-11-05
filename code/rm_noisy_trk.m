function data = rm_noisy_trk(options, data_noisy)

X = data_noisy{1};
Y = data_noisy{2};
T = data_noisy{3};

rangx = abs( X(:,end) - X(:,1));
rangy = abs( Y(:,end) - Y(:,1));
rang_xy = sqrt(rangx.^2+ rangy.^2);

[noise_r_1,~] = find(X == 'NaN' | Y == 'NaN' | X < 0 | Y < 0 );
[noise_r_2,~] = find(rang_xy < 2 );
noise_r = union(noise_r_1,noise_r_2);

%non_noise_r = X(~isequal(noise_r),:);

noise_r_bin = zeros(1,size(X,2));
noise_r_bin(noise_r) = 1;

X  = X(~noise_r_bin,:);
Y = Y(~noise_r_bin,:);
T = T(~noise_r_bin,:);

data{1} = X;
data{2} = Y;
data{3} = T;
%trj2trkl_new(X,Y,T);