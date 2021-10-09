

%% This file will show you how to calculate the ultimate pit limit using
%% multiple realization orebody model

% Load the data file; The data file must contain the X, Y, Y and simulated
% grade column. First column is assigned for X, second column for Y and 3rd
% column for Z and sebsequent columns are for different realizations.

load simulation20.dat;

% Assigned a variable name for the loaded data file
X=simulation20;

%X=X(1:9953,:);

nx=20;  %size of block in x direction

ny=20;  %size of block in y direction

nz=10;  %size of block in z direction


num1=20; %% number of simulated realisations are there in your data file

flag=0; % if you don't want to generate regular grid file

[K1 K2]=prepros(X,num1,nx,ny,nz, flag); % if your all simulation results are stored in single column then used this program to generate seperate column for seperate simulatino

% if flag=1; the grid file (K2) will be generated inserting some blocks with '0'
% grade; otherwise K1 and K2 will be same with number of columns equal to
% 3+number of realisations (3 for X, Y, and Z cordinate);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num=20; %% number is simulation number you are interested in


spgr=2.7; %specific gravity of rock

rec=1;    %recovery

slprc=1.9;    % selling price of ore

slcst=0.4;  % selling cost of ore

prcst=9;    %processing cost of ore

mncst=1;    % mining cost of rock

%prtrg=0.76e+07; %production target; if your aim is to generate ultimate pit and push back design, this paramater value is not required

lamda=1;    %By changing lamda value you can generate number of pushbacks; if your aim is to generare ultimate pit, then work with lamda value 1 

%lamda=0.01;    %initial lamda value; 

%dellam=0.01;  %increment of lamda

conesize=5;  %number of blocks need to extract before reaching a given block; In our program, we have two options (a) 5 and (b) 9

infi=999999999; %large positive number treated as infinite


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function will calculate the block economic value and summed up over
% all realization based of ore and waste

std=1; % std value will be standarised the block economic value if necessary; std=1 will leave the block value as it is.

[P1]=bevcal(K1,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,std);

% P1 contains 6 colums: 
% column 1: Node identification number
% column 2 to 4: X, Y, and Z conrdinate
% column 5: sum of block economic value over all realization if they are
% ore blocks
% column 6: sum of absolute block economic value if they are waste over
% realization

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This program will generate the slope constraints;

% Be cautious; this program may take time if you have large orebody model.

% If you are planning to use paramateric version or have aim to use
% different realization for many time, then it is suggested to generate
% slope constraints file "D" only once. No need to repeate this step.

D=mincutslop(P1,nx,ny,nz,conesize);

% D containts 2 columns
% column 1: Node identification number for starting node of an arc
% column 2:Node identification number for ending node of an arc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% This file will generate your ultimate pit

[G G1 Flowresult]=ultipit(P1,D,K1, lamda,infi);

% G has same structure of your K1 file plus 3 more columns (a) sum of block
% economic value when they are ore; (b) sum of absolute block economic
% value when they are waste; (c) columns to identify which blocks are
% inside the pit and which are out side the pit; +1 for in side the pit, -1
% for outside the pit; Column 6 in file G shows that assignment

%G1 is same as G but only with those blocks which are inside the pit

% Flowresult file consists of the network flow results which may not be
% necessary for our analysis

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Below function will provide you the cash flow generated from your
% ultimate pit

cutgr=0.3; % Cutoff grade
k=0.1; %rate of interest
t=0;  %production period; if your aim is to calculate total cash flow then use  t=0

Cashflow=prsntval(G1,num,nx,ny,nz,spgr,rec,slprc,slcst,prcst,mncst,k,t,cutgr);

% Cashflow file has 4 columns
% Column 1: Ore production
% Column 2: Waste production
% Column 3: Metal Production
% Column 4: Cash flow

% Number of rows = number of realisations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Below codes will help you to genrate gird file which you can import to any
% graphics software for visualise your pit

G2=[G(:,1:3) G(:,6)];
gridpitgraph=Regrid(G2,20,20,10,-999);

% -999 for air blocks or non-available data blocks

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

