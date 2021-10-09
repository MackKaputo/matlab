function [S2]=anal(X,simnum,cutgr,yr,push)


[n1 n2]=size(X);
sim=n2-push;

p=[];
for i=sim+1:n2
    p=[p i];
end

S=sortrows(X, -p);

l=n2-sim;
%S1=[];
for i=1:n1
    s1=0;
    for j=sim+1:n2
        if S(i,j)~=-1
        s1=s1+S(i,j);
        end
    end
    S(i,n2+1)=l-s1+1;
end
S1=[];
for i=1:n1
    if S(i,n2+1)~=l+1;
        S1=[S1;S(i,:)];
    end
end

for i=1:simnum
    D=[S1(:,1:3) S1(:,3+i) S1(:,n2+1)] ;
   eval(['D',num2str(i),'=D;']);
end

for j=1:simnum
    eval(['D=D',num2str(j),';'])
    D=sortrows(D, [5 -3 -4 2 1]);
    t1=[];
    for i=1:length(D(:,1))
        if D(i,4)>=cutgr
            t1=[t1;1];
        else t1=[t1;0];
        end
    end
    D=[D t1];
    D=[D cumsum(D(:,6))];
    p1=ceil(max(D(:,7))/yr);
 
    for i=0:yr-1
         k=[];
        for m=1:length(D(:,1))
            if (D(m,7)>p1*i) & (D(m,7)<=p1*(i+1))
                k=[k;D(m,:)];
            end
        end
      eval(['K',num2str(i+1),'=k;'])
    end
    %K={K1,K2,K3,K4,K5,K6,K7,K8};
    Y=[];
    for i=1:yr
        eval(['K=K',num2str(i),';'])
        [y1 y2 y3 y4]=orenpvmetal(K,1,cutgr);
        Y=[Y;y1 y2 y3 y4];
        %eval(['L',num2str(i),'=Y;'])
    end
    
   
    eval(['N',num2str(j),'=Y;'])
end

S2=[];
for i=1:simnum
    eval(['s=N',num2str(i),';'])
    S2=[S2;s];
end

%S=p;
    
%S=[n1 n2];