function S=slopehoch(P,dx,dy,dz)
D=[];

for i=-1:1
    for j=-1:1
        if abs(i)~=abs(j)
            D=[D;dx*i dy*j];
        end
    end
end
D=[0 0; D];
D=[D dz*ones(length(D),1)];



D1=[];


for i=-2:2
    for j=-2:2
        if (i==2*j)||(2*i==j)||(i==-2*j)||(2*i==-j)
            D1=[D1;dx*i dy*j];
        end
    end
end

D1=[D1 2*dz*ones(length(D1),1)];
D1(5,:)=[];
D=[D;D1];

S=[];
h=waitbar(0,'wait, calculation progressing ');
for i=1:length(P)
    c=P(i,1:4);
    %s=zeros(length(D(:,1)),3)
    for k=1:length(D)
        s=[c(1,2)+D(k,1) c(1,3)+D(k,2) c(1,4)+D(k,3)];
        l=find(P(:,2)==s(1,1) & P(:,3)==s(1,2)& P(:,4)==s(1,3));
        if ~isempty(l)
        S=[S;c(1,1) P(l,1)];
        end
    end
    waitbar(i/length(P),h)
end
close(h)