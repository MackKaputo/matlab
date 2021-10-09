%% if we are keeping 1 blocks in Z direction per level
% X, Y and Z refer to number of blocks in each direction.


s = ones(21,16,14);
sz = size(s);
for(i=1:1:sz(3))
    if(i > 1)
        for(j=1:1:sz(2))
            for(k=1:1:sz(1))
                if(j < i || j > sz(2)- i + 1)
                    s(k,j,i) = 0;
                else
                    if(k < i || k > sz(1)- i + 1)
                        s(k,j,i) = 0;
                    end
                end
            end
        end
    end
end
aa=reshape(s,[],1);
slop=flipud(aa);



%% if we are keeping 2 blocks in Z direction per level

X = (15525-13500)/25;
Y = (28750-26575)/25;
Z = (4137-3437)/10;


s = ones(X,Y,Z);
sz = size(s);
for(i=1:2:sz(3));
    if(i > 2)
        for(j=1:1:sz(2))
            for(k=1:1:sz(1))
                if(j < (i+1)*0.5 || j > sz(2)- (i - 1)*0.5)
                    s(k,j,i) = 0;
                    s(k,j,i+1)=0;
                else
                    if(k < (i+1)*0.5 || k > sz(1)- (i - 1)*0.5)
                        s(k,j,i) = 0;
                        s(k,j,i+1)=0;
                    end
                end
            end
        end
    end
end

aa=reshape(s,[],1);
slop=flipud(aa);
