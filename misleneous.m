load simulation20.dat;
    n=9953;

for i=0:5
    K=simulation20((n*i)+1:n*(i+1),1:4);
    eval(['K',num2str(i+1),'=K;'])
end

L=K1(:,1:3);
for j=1:6
    eval(['K=K',num2str(j),';'])
L=[L K(:,4)];
end

M=L;
m=mean(L(:,4:9)');
M=[M m'];

y=[];
for i=1:n    
ind1 =((20*20*10*2.4)*M(i,10)*0.9)/100;
ind2= ind1*2000*(2-0.3);
ind3=ind2-(20*20*10*2.4)*10;
y=[y; ind1 ind2 ind3];  
clear ind1 ind2 ind3 y1;
end
M=[M y];


y=[];
for i=1:n
    if M(i,13)<0
        M(i,13)=9600;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:9953
    if (H(i,6)==1) && (H(i,5)==1) && (H(i,4)==1)
        H(i,7)=1;
    elseif (H(i,6)==1) && (H(i,5)==1) && (H(i,4)==-1)
            H(i,7)=2;
             elseif (H(i,6)==1)&& (H(i,5)==-1)&& (H(i,4)==-1)
                 H(i,7)=3;
    else H(i,7)=-999;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5