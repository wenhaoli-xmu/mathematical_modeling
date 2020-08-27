function y = objscore(A, weight)

%计算评价对象的得分，传入一个标准化矩阵，可以带权重
%
% y = score(A, weight)
%
% A         标准化后的矩阵（m*n）
% weight    （可选）权重向量，行列均可，与层次分析法混用

[m, n] = size(A);

if nargin == 2 && size(weight, 2) == 1
    weight = weight';
end

MAX = max(A);
MIN = min(A);

Dmax = zeros(m, 1);
Dmin = zeros(m, 1);
S = zeros(m, 1);

for i = 1:m
    v = A(i, :);
    if nargin == 1
        Dmax(i) = norm(MAX - v);
        Dmin(i) = norm(v - MIN);
    elseif nargin == 2
        v = MAX - v;
        v = v.^2;
        v = v.*weight;
        Dmax(i) = sum(v).^0.5;
        
        v = v - MIN;
        v = v.^2;
        v = v.*weight;
        Dmin(i) = sum(v).^0.5;
    end
end

S = Dmin ./ (Dmax + Dmin);
y = S;

end