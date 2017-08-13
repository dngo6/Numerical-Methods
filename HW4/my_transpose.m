function [B] = my_transpose(A)
    sizeA = size(A);
    for i = 1: sizeA(1)
        for j = 1: sizeA(2)
            B(j, i) = A(i,j);
        end
    end
end
