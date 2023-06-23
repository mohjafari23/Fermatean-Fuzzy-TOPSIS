clc;
clear;
close all;
m=4; %number of alternatives
n=5; % number of criteria
w=[.2,.2,.1,.3,.2]'; % criteria weights
CS=[1,1,1,1,-1]; %if criteria is benefit +1 , if is cost -1
R={[.7,.3],[.4,.6],[.5,.5],[.8,.2],[.8,.4];[.5,.8],[.8,.6],[.4,.5],[.7,.4],[.6,.5];...
    [.9,.6],[.8,.1],[.6,.4],[.7,.5],[.9,.3];[.6,.7],[.8,.3],[.7,.2],[.5,.3],[.7,.3]}; %decission matrix
score=zeros(m,n); %emty score matrix
for i=1:m
for j=1:n
a=R{i,j};     % a is a dummy matrix 
score(i,j)=a(1)^3 - a(2)^3; %calculating score of R
end
end
Splus=R(score==CS.*max(score.*repmat(CS,[m,1])))'; %FFPIS
Sminus=R(score==CS.*min(score.*repmat(CS,[m,1])))';%FFNIS

for i=1:n
    a=Splus{i}; % a is a dummy matrix 
    b=Sminus{i};% b is a dummy matrix 
Splus{i}=[Splus{i},nthroot((1-a(1)^3-a(2)^3),3)];   %pi Splus
Sminus{i}=[Sminus{i},nthroot((1-b(1)^3-b(2)^3),3)]; %pi Splus
end


for i=1:m
    for j=1:n
    a=R{i,j}; % a is a dummy matrix 
R{i,j}=[R{i,j},nthroot((1-a(1)^3-a(2)^3),3)];   %Pi R

    end
end

Dplus=zeros(m,1);
Dminus=zeros(m,1);
d=zeros(2,n);
for i=1:m
for j=1:n
a=R{i,j};
b=Splus{1,j};
c=Sminus{1,j};
d(1,j)=w(j)*sqrt(.5*sum(((a.^3-b.^3).^2)));
d(2,j)=w(j)*sqrt(.5*sum(((a.^3-c.^3).^2)));
end
Dplus(i)=sum(d(1,:));
Dminus(i)=sum(d(2,:));
d=zeros(2,n);
end
Dminplus=min(Dplus);
Dmaxminus=max(Dminus);
RC=(Dminus)./(Dplus+Dminus);
EE=((Dminus)./(Dmaxminus))-((Dplus)./(Dminplus));
[~,rank] = sort(EE,'descend');
disp("Ranking of the alternatives:");
disp(rank);
