function [Y1 Y2 Y3 Y4]=orenpvmetal(Spush1,simnum,cutgr)


for i=1:simnum
    E=[Spush1(:,1:3) Spush1(:,3+i)] ;
    eval(['E',num2str(i),'=E;']);
end
 
for j=1:simnum
    eval(['E=E',num2str(j),';'])
y=[];
for i=1:length(E(:,1))
    if E(i,4)>=cutgr
    ind1 =(((20*20*10*2.7)*E(i,4)*0.9)/100)*(2000*(2-0.3))-(20*20*10*2.7)*9 - (20*20*10*2.7)*1; 
    else ind1=-(20*20*10*2.7)*1;
    end
    y=[y;ind1];
    clear ind1;
end
E=[E y];
eval(['E',num2str(j),'=E;'])
end

Y1=[];
for j=1:simnum
    eval(['E=E',num2str(j),';'])
y1=0;
y2=0;


for i=1:length(E(:,1))
if E(i,5)>0
    y1=y1+E(i,5);
else y2=y2+E(i,5);
end
end
Y1=[Y1;y1 y2];
end
Y1=[Y1 (Y1(:,1)+Y1(:,2))];

Y2=[];
for j=1:simnum
    eval(['E=E',num2str(j),';'])
y1=0;
y2=0;
for i=1:length(E(:,1))
    if E(i,4)>=cutgr
    y1=y1+(20*20*10*2.7); 
    else y2=y2+(20*20*10*2.7);
    end
end
Y2=[Y2; y1 y2];
end

Y3=[];
for j=1:simnum
    eval(['E=E',num2str(j),';'])
y1=0;

for i=1:length(E(:,1))
    if E(i,4)>=cutgr
    ind=((20*20*10*2.7)*E(i,4)*.9)/100; 
    y1=y1+ind;
    end
end
Y3=[Y3; y1];
end

Y4=[];
for j=1:simnum
    eval(['E=E',num2str(j),';'])
y1=0;
y2=0;

for i=1:length(E(:,1))
if E(i,4)>=cutgr
    y1=y1+1;
else y2=y2+1;
end
end
Y4=[Y4;y1 y2];
end
