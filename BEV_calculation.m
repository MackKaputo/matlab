load simulation20.dat;
    n=9953;
    V=[];
for i=0:19
    C=simulation20((n*i)+1:n*(i+1),1:4);
    eval(['C',num2str(i+1),'=C;'])
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W=C(:,1:3);
for j=1:20
   eval(['C=C',num2str(j),';'])
W=[W C(:,4)];
end
D3=Regrid(W,20,20,10,0);
for i=1:20
    C=[D3(:,1:3) D3(:,i+3)];
    eval(['C',num2str(i),'=C;'])
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for j=1:20
    eval(['C=C',num2str(j),';'])
y=[];
for i=1:length(C(:,1))
    ind1 =((20*20*10*2.4)*C(i,4)*0.9)/100; % Total tonnage from a block
    ind2= ind1*2000*(3-0.3);                % Revenue generated from block
    ind3=ind2-(20*20*10*2.4)*(9+1);         % 9 and 1 are processing and mining cost respectively
    y1=[ind1 ind2 ind3];
    y=[y;y1];
    clear ind1 ind2 ind3 y1;
end
C=[C y];
eval(['C',num2str(j),'=C;'])
end

for j=1:20
    eval(['C=C',num2str(j),';'])
y=[];
for i=1:length(C(:,1))
    if C(i,7)<0
        C(i,7)=9600;                %Mining cost per block
    end
end

eval(['C',num2str(j),'=C;'])
end



P=C(:,1:3);
for j=1:20
    eval(['C=C',num2str(j),';'])
    
p=nan([length(C),2]);
for i=1:length(C)
    if C(i,7)==9600
        p(i,1)=C(i,7);
    else 
        p(i,2)=C(i,7);
    end
end
P=[P p];
end


p1=[];    
for i=1:length(C)
    p1(i,1)=nansum(P(i,5:2:end));
    p1(i,2)=nansum(P(i,4:2:end));
end

P1=[];
for i=1:length(C)
    p2=i+1;
    P1=[P1;p2];
end

P1=[P1 C(:,1:3) p1];

