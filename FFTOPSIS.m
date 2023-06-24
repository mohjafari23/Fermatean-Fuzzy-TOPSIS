function [rank,RC]= FFTOPSIS(w,CS,R,rc)
%m is number of alternatives
%n is number of criteria
%w is criteria weights
% cs is criteria sign if criteria is benefit +1 , if is cost -1
%R is decission cell
%rc=true for relative closeness, rc=fulse for revised closeness by Vench and Mirjaberi (2014)

score=ffscore(R); %calculating score of decission cell
[m,n]=size(R);
Splus=R(score==CS.*max(score.*repmat(CS,[m,1])))'; %FFPIS
Sminus=R(score==CS.*min(score.*repmat(CS,[m,1])))';%FFNIS

Splus=PIcal(Splus);
Sminus=PIcal(Sminus);
R=PIcal(R);

[Dplus,Dminus]=ffdistance(R,w,Splus,Sminus);

Dminplus=min(Dplus);
Dmaxminus=max(Dminus);

[rank,RC]=rankcal(Dplus,Dminus,Dminplus,Dmaxminus,rc);   

disp("Ranking of the alternatives:");
disp(rank);

end
