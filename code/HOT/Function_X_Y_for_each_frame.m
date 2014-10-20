function [trk ] = Function_X_Y_for_each_frame(tracklet,trkstart,tracklet_length )
trkstart=trkstart-1;
trkend=trkstart+tracklet_length;
    trk=[];
    for i = 1:size(tracklet,2)
        a=(tracklet(i).t(1));
        b=(tracklet(i).t(end));
        
        if (trkstart>= a&&( trkend<=b))
            startindex=find(tracklet(i).t==trkstart );
            endindex=find(tracklet(i).t== trkend );
            tracklet1(i).t=tracklet(i).t([startindex:endindex]);
            tracklet1(i).x=tracklet(i).x([startindex:endindex]);
            tracklet1(i).y=tracklet(i).y([startindex:endindex]);
        elseif (trkstart<= a)&& (trkend<= b)
              startindex=find(tracklet(i).t==a );
            endindex=find(tracklet(i).t== trkend );
            tracklet1(i).t=tracklet(i).t([startindex: endindex]);
            tracklet1(i).x=tracklet(i).x([startindex: endindex]);
            tracklet1(i).y=tracklet(i).y([startindex: endindex]);
        elseif (trkstart>= a)&& (trkend>= b)
             startindex=find(tracklet(i).t==trkstart);
            endindex=find(tracklet(i).t== b );
            tracklet1(i).t=tracklet(i).t([startindex: endindex]);
            tracklet1(i).x=tracklet(i).x([startindex: endindex]);
            tracklet1(i).y=tracklet(i).y([startindex: endindex]);
            
        end
        if(tracklet1(i).t(:)>=0)
       trk(1,end+1).t=tracklet1(i).t;
       trk(1,end).x=tracklet1(i).x;
       trk(1,end).y=tracklet1(i).y;
        end
    end
end

