

%load simulation20.dat;
%X=simulation20;
num=100;
%X=X(1:9953,:);

nx=50;  %size of block in x direction
ny=50;  %size of block in y direction
nz=10;  %size of block in z direction
spgr=2.86; %specific gravity of rock
rec=0.9;    %recovery
%slprc=1.9;    % selling price of ore
slcst=3.36;  % selling cost of ore
prcst=6;    %processing cost of ore
mncst=0.6;    % mining cost of rock
prtrg=0.76e+07; %production target
%lamda=0.01;    %initial lamda value
%dellam=0.01;  %increment of lamda
conesize=5;  %number of blocks need to extract before reaching a given block
infi=999999999; %large positive number treated as infinite
