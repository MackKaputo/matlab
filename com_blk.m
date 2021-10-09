function ind=com_blk(pushback1,pushback2)
ind=[];
for i=1:length(pushback1)
    indi=find((pushback2(:,1)==pushback1(i,1))& (pushback2(:,2)==pushback1(i,2))& (pushback2(:,3)==pushback1(i,3)));
    ind=[ind;indi];
end