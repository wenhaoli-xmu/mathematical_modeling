function y = normal(A)

%对矩阵 A 的列进行归一化处理
%
%y = normal(A)
%
%A      待归一化的矩阵

for i = 1:size(A, 2)
    s = sum(A(:, i));
    A(:, i) = A(:, i) ./ s;
end

y = A;
