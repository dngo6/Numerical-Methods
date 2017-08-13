%David Duy Ngo
%ENGR219 Exam 1, Question 6
clear
n = 7;
sub = 1;
A = [];
current = 0;
current_dia = 1;

for i=1:n
    for j = 1:n
        if i == 0 && j == 0
            A(i,j) = 1;
        else
            if j == i-1
                A(i,j) = sub;
            end
            if j == i+1
                A(i,j) = current + 1;
                current = current + 1;
            end
            if (j == i)
                A(i,j) = current_dia + current;
                current_dia = A(i,j);
            end
        end

    end
end