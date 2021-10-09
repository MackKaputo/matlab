for i=1:9953
    if (H(i,6)==1)&& (H(i,5)==-1)&& 
        H(i,7)=1;
    elseif (H(i,6)==1) && (H(i,5)==1)
            H(i,7)=2;
             elseif (H(i,6)==1) && (H(i,5)==1) && (H(i,4)==1)
                 H(i,7)=3;
    else H(i,7)=-999;
    end
end

            