function [S HH] =common_final(X1,p)
%X1 = K41;
%p = K42;
inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,1)==X1(jj,1)& p(:,2)==X1(jj,2)& p(:,3)==X1(jj,3));
%%indi1=find(p(jj,2)==X1(:,1)& p(jj,3)==X1(:,2)& p(jj,4)==X1(:,3));

inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];common
end
S=p(inficap,:);

gg = zeros(3,length(p));
gg (1,:) = 1:length(p);
for i=1:length(inficap)
    for j=1:length(gg(1,:))
        if inficap(i,1) == gg(1,j)
            gg(2,j)=1;
        end
    end
end

gg (3, :) = ~gg(2, :);

col = find(gg(3, :)');


HH=p(col,:);