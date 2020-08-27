function y = weight(A, opt)

%计算判断矩阵的权重
%
%y = weight(A, opt)
%
%A          判断矩阵，必须是方阵
%opt        方法选择，可以选择‘算数平均法’、‘几何平均法’、‘特征值法’

if nargin == 1
    A = normal(A);
    w = zeros(size(A, 1), 1);
    for i = 1:size(A, 1)
        w(i) = sum(A(i, :));
    end
    y = normal(w);
elseif nargin == 2
    if strcmp(opt, '算数平均法') == 1
        A = normal(A);
        w = zeros(size(A, 1), 1);
        for i = 1:size(A, 1)
            w(i) = sum(A(i, :));
        end
        y = normal(w);
    elseif strcmp(opt, '特征值法') == 1
        [v, d] = eig(A);
        lambda = diag(d);
        lambda_max = max(lambda);
        idx = find(d == lambda_max);
        u = v(:, idx);
        y = normal(u);
    elseif strcmp(opt, '几何平均法') == 1
        v = zeros(size(A, 1), 1);
        for i = 1:length(v)
            tmp = cumprod(A(i, :));
            tmp = tmp(end);
            v(i) = tmp;
        end
        v = v.^(1/size(A, 1));
        y = normal(v);
    end
end

end