function [rank,RC]=rankcal(Dplus,Dminus,Dminplus,Dmaxminus,rc)

        if (rc==true)
            RC=(Dminus)./(Dplus+Dminus);
            [~,rank] = sort(RC,'descend');
             else
                    RC=((Dminus)./(Dmaxminus))-((Dplus)./(Dminplus));
                    [~,rank] = sort(RC,'descend');
        end
end
