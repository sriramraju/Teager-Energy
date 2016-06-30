function out = Calcteager(in)

Fs = 256;
cnt = 0;

pos_strt = min(find(in(:,2) ~= 0));
pos_end = max(find(in(:,2) ~= 0));

if isempty(pos_strt) ~= 1
    
    for i=pos_strt:Fs:pos_end
        cnt = cnt + 1;
        if i+Fs-1 > pos_end
            temp = in(i:pos_end,:);
        else
            temp = in(i:i+Fs-1,:);
        end
        
        
        mag_acc = sqrt( ((temp(:,2)-2048)/84).^2 + ((temp(:,3)-2048)/84).^2 + ((temp(:,4)-2048)/84).^2);
        val = teagerCompute( mag_acc, 100 );
        out(cnt,:) = [in(i,1) mean(val)];
        
    end
    temp_1 = [in(1:pos_strt,1) zeros(pos_strt,1)];
    temp_2 = [in(pos_end:end,1) zeros(length(in(pos_end:end,1)),1)];
    out = [temp_1;out;temp_2];
    
else
    
    out = [1 1];
    
end

end

