function [k, b, sst, sse, ssr, r2] = linefit(x, y)

% 使用直线进行拟合，并获得各种优度参数
%
% [k, b, sst, sse, ssr, r2] = linefit(x, y)
%
% k, b                      直线参数
% sst, sse, ssr, r2         优度参数
% x, y                      待拟合的样本点

if size(x, 1) == 1
    x = x';
end
if size(y, 1) == 1
    y = y';
end

n = length(x);
k = (n*sum(x.*y) - sum(x)*sum(y))/(n*sum(x.*x) - sum(x)*sum(x));
b = (sum(x.*x)*sum(y) - sum(x)*sum(x.*y))/(n*sum(x.*x)-sum(x)*sum(x));

y_hat = k.*x + b;
y_avg = sum(y)/length(y);

sst = sum((y - y_avg).^2);
sse = sum((y - y_hat).^2);
ssr = sum((y_hat - y_avg).^2);
r2 = ssr/sst;
    

end