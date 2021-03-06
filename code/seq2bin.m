% function bin_all = seq2bin(options,trk_magnitude,trk_orientation)
% 
% bin_all = zeros(size(trk_magnitude,1),options.number_of_orientation.*options.numbin.*(options.tracklet_length-1));
% 
% for trk = 1 : size(trk_magnitude,1)
%     trk
%     tracklet_m = trk_magnitude(trk,:);
%     tracklet_o = trk_orientation(trk,:);
%     bin_tracklet = tracklet2bin(options,tracklet_m,tracklet_o);
%     bin_all(trk,:) = bin_tracklet;
% end
function linear_index = seq2bin(options,trk_magnitude,trk_orientation)
% ALE
for frnum=1:size(trk_magnitude,2)
    
mags = trk_magnitude(:,frnum);
ors = trk_orientation(:,frnum);

range_m=linspace(0,options.max_magnitude_all,options.numbin);
range_o=linspace(-pi,pi/4,8);

[~,id_mag] = min( abs( bsxfun( @minus, range_m',mags') ) );
[~,id_or] = min( abs( bsxfun( @minus, range_o',ors') ) );

linear_index(frnum,:) = sub2ind( [options.numbin, 8 ],id_mag,id_or);
% hot_descriptor = reshape( histc( linear_index , 1:options.numbin*8  ),  [options.numbin, 8 ] );

end
