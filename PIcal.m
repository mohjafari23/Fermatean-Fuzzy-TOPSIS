function sp=PIcal(cell)
%PI is the dgree of indeterminacy 
%sp is the cell with the pi
[m,n]=size(cell);
sp=cell(m,n); %empty cell to reallocate memory
    for i=1:m
        for j=1:n
            a=cell{i,j}; % a is a dummy matrix 
            sp{i,j}=[cell{i,j},nthroot((1-a(1)^3-a(2)^3),3)];   %Pi cal
    
        end
    end
end
