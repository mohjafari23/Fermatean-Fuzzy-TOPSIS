function [Dplus,Dminus]=ffdistance(R,w,Splus,Sminus)

[m,n]=size(R);
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

end
