

load ijk_OK.dat
S1=ijk2gslib(ijk_OK,12640,9500,34, 20,20,10);
S2=[S1(:,1)+10 S1(:,2)+10 S1(:,3)+5 S1(:,6)];

load simulation20.dat;
X=simulation20;
num=20;

nx=20;  %size of block in x direction
ny=20;  %size of block in y direction
nz=10;  %size of block in z direction
spgr=2.4; %specific gravity of rock
rec=0.9;    %recovery
slprc=3;    % selling price of ore
slcst=0.3;  % selling cost of ore
prcst=9;    %processing cost of ore
mncst=1;    % mining cost of rock
prtrg=0.76e+07; %production target
lamda=0.01;    %initial lamda value
dellam=0.01;  %increment of lamda
conesize=9;  %number of blocks need to extract before reaching a given block
infi=9999999999; %large positive number treated as infinite

[K1 K2]=prepros(X,num,nx,ny,nz);

inficap=[];
%%inficap1=[];
for jj=1:length(K1)
indi=find(S2(:,1)==K1(jj,1)& S2(:,2)==K1(jj,2)& S2(:,3)==K1(jj,3));
%%indi1=find(p(jj,2)==X1(:,1)& p(jj,3)==X1(:,2)& p(jj,4)==X1(:,3));
inficap=[inficap; indi];
%%inficap1=[inficap1; indi1];
end

S2(inficap,:)=[];

K3=[K1; S2(:,1:3) zeros(length(S2),num)];

[P1]=bevcal(K3,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,std);

D=mincutslop(P1,nx,ny,nz,conesize);
