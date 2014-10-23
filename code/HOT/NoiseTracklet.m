function data = NoiseTracklet(data_noisy)

[ X,Y,T ] = X_Y_matrix(options,data_noisy);

[m,n] = size(X);
tic;


rangx = abs( X(:,end) - X(:,1));
rangy = abs( Y(:,end) - Y(:,1));
rang_xy = sqrt(rangx.^2+ rangy.^2);

[noise_r_1,~] = find(X == NaN | Y == NaN | X < 0 | Y < 0 );
[noise_r_2,~] = find(rang_xy < 2 );
noise_r = union(noise_r_1,noise_r_2);

%non_noise_r = X(~isequal(noise_r),:);

noise_r_bin = zeros(1,size(X,2));
noise_r_bin(noise_r) = 1;

tracklet(trknum).x  = X(~noise_r_bin,:);
tracklet(trknum).y = Y(~noise_r_bin,:);
tracklet(trknum).t = T(~noise_r_bin,:);

data = trj2trkl_new(X,Y,T);