function [G Flowresult]=ultipit_price(P1,D,lamda1,lamda2,infi)

A=P1;

s=infi*ones(length(D),1);
D=[D s];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Alam=[];
%for i=1:length(A(:,1))
 %   if A(i,5)~=0
  %  Alam=[Alam;A(i,1) A(i,5)];
   % end
%end

k=find(P1(:,5)~=0);
Alam=(P1(k,:));

%A1=[ones(length(Alam(:,1)),1) Alam(:,1) lamda*Alam(:,5)];
A1=[ones(length(Alam(:,1)),1) Alam(:,1) lamda1*Alam(:,5)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k2=find(P1(:,6)~=0);
A2=P1(k2,:);
%for i=1:length(A(:,1))
 %   if A(i,6)~=0
  %  A2=[A2;A(i,1) A(i,6)];
   % end
%end

%A2=[A2(:,1) (length(A(:,1))+2)*ones(length(A2),1) A2(:,6)];

A2=[A2(:,1) (length(A(:,1))+2)*ones(length(A2),1) lamda2*A2(:,6)];


A3=[A1;A2];

A4=[A3;D];
A4=[A4; (length(A(:,1))+2) (length(A(:,1))+1) 0];
A5=round(A4(:,3));
A6=[A4(:,1:2) A5];

S = spconvert(A6);
[flow cut R F] = push_relabel_max_flow(S,1,(length(P1(:,1))+2));


G=(A(:,2:6));
%t=cut(2:end-1,1);
%G=[G t];
%G=[G C(:,4:end)];
%save data.dat G -ASCII;

%k3=find(G(:,6)==1);
%G1=G(k3,:);
%G1=[];
%for i=1:length(G(:,1))
 %   if G(i,6)==1
  %      G1=[G1;G(i,:)];
   % end
%end

Flowresult={flow,cut,R,F};

