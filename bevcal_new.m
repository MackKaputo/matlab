function [P1 P P2]=bevcal_new(D3,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,stdi,flag, lamda1,lamda2,orecon,wstcon,cutgrd)

   

for i=1:num
    C=[D3(:,1:3) D3(:,i+3)];
    eval(['C',num2str(i),'=C;'])
end

if flag==1
mncostpb=(nx*ny*nz*spgr*mncst)/stdi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=C(:,1:3);
P2=C(:,1:3);
for j=1:num
    eval(['C=C',num2str(j),';'])
%y=[];
p=nan([length(C),2]);
for i=1:length(C(:,1))
    y(i)=((((((nx*ny*nz*spgr)*C(i,4)*rec)/100)*2000*(slprc-slcst))-(nx*ny*nz*spgr)*(prcst+mncst)))/stdi;         % 9 and 1 are processing and mining cost respectively
    %y1(i)=[ind1 ind2 ind3];
    if y(i)<=0
        y(i)=-mncostpb;                %Mining cost per block
    end
    if y(i)==-mncostpb
        p(i,1)=-y(i);
    else 
        p(i,2)=y(i);
    end
    %y=[y;y1];
    clear ind1 ind2 ind3 y1;
end
P=[P p];
P2=[P2 y'];
end
else
    
    if flag==0
        %mncostpb=(nx*ny*nz*spgr*mncst)/stdi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=C(:,1:3);
for j=1:num
    eval(['C=C',num2str(j),';'])
%y=[];
p=nan([length(C),2]);
for i=1:length(C(:,1))
    if C(i,4)>cutgrd
    y(i)=(((((((nx*ny*nz*spgr)*C(i,4)*rec)/100)*2000*(slprc-slcst))-(nx*ny*nz*spgr)*(prcst+mncst)))/stdi)-(lamda1*orecon)/stdi;
    %y(i)=(((((((nx*ny*nz*spgr)*C(i,4)*rec)/100)*2000*(slprc-slcst))-(nx*ny*nz*spgr)*(prcst+mncst)))-(lamda1*orecon))/stdi;         % 9 and 1 are processing and mining cost respectively
    %y1(i)=[ind1 ind2 ind3];
    else
        y(i)=-(((nx*ny*nz*spgr)*(mncst)))/stdi-(lamda2*wstcon)/stdi;
    %if y(i)<=0
    %    y(i)=-mncostpb;                %Mining cost per block
    %end
    end
    if y(i)<=0
        p(i,1)=-y(i);
    else 
        p(i,2)=y(i);
    end
    %y=[y;y1];
    clear ind1 ind2 ind3 y1;
end
P=[P p];
end
%end
else
    if flag==2
        %if flag==0
        %mncostpb=(nx*ny*nz*spgr*mncst)/stdi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=C(:,1:3);
for j=1:num
    eval(['C=C',num2str(j),';'])
%y=[];
p=nan([length(C),2]);
for i=1:length(C(:,1))
    %if C(i,4)>cutgrd
    y(i)=(((((((nx*ny*nz*spgr)*C(i,4)*rec)/100)*2000*(slprc-slcst))-(nx*ny*nz*spgr)*(prcst+mncst)))/stdi)-(lamda1*orecon)/stdi-(lamda2*wstcon)/stdi;
    %y(i)=(((((((nx*ny*nz*spgr)*C(i,4)*rec)/100)*2000*(slprc-slcst))-(nx*ny*nz*spgr)*(prcst+mncst)))-(lamda1*orecon))/stdi;         % 9 and 1 are processing and mining cost respectively
    %y1(i)=[ind1 ind2 ind3];
   % else
    %    y(i)=-(((nx*ny*nz*spgr)*(mncst)))/stdi-(lamda2*wstcon)/stdi;
    %if y(i)<=0
    %    y(i)=-mncostpb;                %Mining cost per block
    %end
    %end
    if y(i)<=0
        p(i,1)=-y(i);
    else 
        p(i,2)=y(i);
    end
    %y=[y;y1];
    clear ind1 ind2 ind3 y1;
end
P=[P p];
end
end
end
end


p1=[];    
for i=1:length(C)
    p1(i,1)=nansum(P(i,5:2:end));
    p1(i,2)=nansum(P(i,4:2:end));
end

P1=(2:length(C(:,1))+1)';
%for i=1:length(C)
  %  p2=i+1;
 %   P1=[P1;p2];
%end

P1=[P1 C(:,1:3) p1];



