load copper.dat
A=[copper(:,1:5) copper(:,10)];

A1=A(1:4847,:); %% These are ore blocks, connect source to there blocks
lamda=0.06;
Alam=lamda*A1(:,6);
%A1=[A1(:,1:2) A1(:,6)]; %%only source to ore blocks connection and their capacity kept in this file
A1=[A1(:,1:2) Alam];
A3=[A1;A2];
A4=[A3;D];
A4=[A4; 9955 9954 0];
A5=round(A4(:,3));
A6=[A4(:,1:2) A5];

S = spconvert(A6);
[flow cut R F] = push_relabel_max_flow(S,1,9955);
x=[];
for i=1:9955
    z=find(cut(i,1)==1);
    x=[x z];
end
x1=length(x);

G1=(copper(:,2:5));
G1=sortrows(G1);

%%Flow_cut_lamdapt0228={flow,cut,R,F};

t=cut(2:9954,1);
%G1=[G1 t];