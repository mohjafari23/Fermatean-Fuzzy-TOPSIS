function sp=PIcal(cell)
%PI is the dgree of indeterminancy 
%sp is the cell with the pi
[m,n]=size(cell);
    for i=1:m
        for j=1:n
            a=cell{i,j}; % a is a dummy matrix 
            sp{i,j}=[cell{i,j},nthroot((1-a(1)^3-a(2)^3),3)];   %Pi cell
    
        end
    end
end
