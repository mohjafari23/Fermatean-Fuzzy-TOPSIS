function score=ffscore(R)
%ffscore is fermatean fuzzy score function
% r is decission cell
% score is the fermatean fuzzy score
%m is number of alternatives
%n is number of criteria
[m,n]=size(R);
score=zeros(m,n); %empty score matrix
    for i=1:m
        for j=1:n
                a=R{i,j};     % a is a dummy matrix 
                score(i,j)=a(1)^3 - a(2)^3; %calculating score of R
        end
    end

end
