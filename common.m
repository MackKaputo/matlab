function S=common(X1,p)

inficap=[];
%%inficap1=[];
for jj=1:length(X1)
indi=find(p(:,1)==X1(jj,1)& p(:,2)==X1(jj,2)& p(:,3)==X1(jj,3));
%%indi1=find(p(jj,2)==X1(:,1)& p(jj,3)==X1(:,2)& p(jj,4)==X1(:,3));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end
S=p(inficap,:);