function bin_all = seq2bin(options,trk_magnitude,trk_orientation)

bin_all = zeros(size(trk_magnitude,1),options.number_of_orientation.*options.numbin.*(options.tracklet_length-1));

for trk = 1 : size(trk_magnitude,1)
    trk
    tracklet_m = trk_magnitude(trk,:);
    tracklet_o = trk_orientation(trk,:);
    bin_tracklet = tracklet2bin(options,tracklet_m,tracklet_o);
    bin_all(trk,:) = bin_tracklet;
end