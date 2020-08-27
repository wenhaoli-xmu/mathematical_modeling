function y = inter2max(x, inter)

% 区间型指标 -> 极大型指标
% 
% y = inter2max(x, inter)
%
% x         区间型指标量
% inter     最佳区间，例如人体最佳体温区间为 [36 37]
%

a = inter(1);
b = inter(2);
M = max([a - min(x), max(x) - b]);
idx = find(x < a);
x(idx) = 1 - (a - x(idx))/M;
idx = x >= a & x <= b;
x(idx) = 1;
idx = find(x > b);
x(idx) = 1 - (x(idx) - b)/M;

y = x;

end

