function y = stand(A)

% 标准化处理
%
% y = stand(A)
%
% A         待标准化处理的矩阵（M*N）
%

[m, n] = size(A);

for i = 1:n
    v = A(:, i);
    X = norm(v, 2);
    v = v./X;
    A(:, i) = v;
end

y = A;

end