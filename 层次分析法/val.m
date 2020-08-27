function y = val(A, B)

%输入权重矩阵，计算出每个方案的得分
%
% y = val(A, B)
% y = val(weight(A), [weight(F1) weight(F2) weight(F3)])
%
% A         目标层->准则层的权重列向量
% B         准则层->方案层，多个权重列向量，横向并在一起形成的矩阵

B = B';
n = size(B, 2);
w = zeros(n, 1);
for i = 1:n
    w(i) = sum(A.*B(:, i));
end
y = w;

end


