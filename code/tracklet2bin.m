function bin_tracklet = tracklet2bin(options,tracklet_m,tracklet_o)

bin_tracklet = zeros(1,options.number_of_orientation.*options.numbin.*(options.tracklet_length-1));

   
    start_ = 1;
for point = 1 : options.tracklet_length-1
    end_ = start_ + options.number_of_orientation.*options.numbin - 1;
    tracklet_m_p = tracklet_m(point);
    tracklet_o_p = tracklet_o(point);
    
    bin_tracklet(1,start_:end_) = point2bin(options,tracklet_m_p,tracklet_o_p);
    start_ = end_+1;
end
