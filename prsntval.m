function restl=prsntval(M,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,t,cutgr,flag)

   
if flag==1

    M1=[M(:,1:3) M(:,7:7+num-1)];
    [m1 n1]=size(M1);
else
    M1=M;
    [m1 n1]=size(M1);
end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for j=1:num
    
s=[];
for i=1:length(M1(:,1))
    ind1 =((nx*ny*nz*spgr)*M1(i,3+j)*rec)/100;
    ind2= (ind1*2000*(slprc-slcst)/(1+k)^t)-(nx*ny*nz*spgr)*(prcst+mncst)/(1+k)^t;                % Revenue generated from block
    ind3=(nx*ny*nz*spgr)*(mncst)/(1+k)^t;                                                       % 9 and 1 are processing and mining cost respectively
    if M1(i,j+3)>=cutgr
    s1=(nx*ny*nz*spgr);                                                                          % total ore tonnage
    s2 =ind1; % Total metal from a block
    s3=ind2;
    else
    s1=-(nx*ny*nz*spgr);                     % total ore tonnage
    s2 =0; % Total metal from a block
    s3=-ind3;
    end
    s=[s; s1 s2 s3];
    clear ind1 ind2 ind3 y1;
end
M1=[M1 s];
end


restl=[];
for j=1:num
    sor=sum(M1(:,n1+3*(j-1)+1)==(nx*ny*nz*spgr));
    swst=sum(M1(:,n1+3*(j-1)+1)==-(nx*ny*nz*spgr));
    sor=(nx*ny*nz*spgr)*sor;
    swst=(nx*ny*nz*spgr)*swst;
    metal=sum(M1(:,n1+3*(j-1)+2));
    npv=sum(M1(:,n1+3*(j-1)+3));
    restl=[restl;sor swst metal npv];
end
