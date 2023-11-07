function msg = geneMIDI(time,angle,vel,targetNote)
    msg = [];
    ang = angle;
    velo_temp = vel;
    
 % 为了过滤掉刚开始的outflyer --- start
    filterFirstHalf = round(0.5 * length(velo_temp));
    upDownBound = max(abs(velo_temp(filterFirstHalf:end)));
    velo_temp2 = saturate(velo_temp,upDownBound);
    velocity = abs(velo_temp2)/max(abs(velo_temp2)); % normalize the velocity to 0-127;
% 为了过滤掉刚开始的outflyer  - end
    noteOnAngle = -1.9; %(deg)
    noteOn = [];
    noteOff = [];
    velOn = [];
    velOff = [];

    for i=1:(length(ang)-1)
        if ang(i)>noteOnAngle && ang(i+1)<noteOnAngle
            noteOn(end+1) = i;
            velOn(end+1) = round(abs(velocity(i))*127);
        end
        if ang(i)<noteOnAngle && ang(i+1)>noteOnAngle
            noteOff(end+1) = i;
            velOff(end+1) = round(abs(velocity(i))*127);
        end
    end

    for i = 1:(length(noteOn)-1)
        OnMsg = midimsg('NoteOn',1,targetNote,velOn(i));
        OffMsg = midimsg('NoteOff',1,targetNote,velOff(i));
        OnMsg.Timestamp = time(noteOn(i));
        OffMsg.Timestamp = time(noteOff(i));
        
        msg = [msg;OnMsg;OffMsg];
    end
end