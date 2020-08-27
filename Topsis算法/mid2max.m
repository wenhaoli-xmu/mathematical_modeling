function y = mid2max(x, best)

% 中间型指标 -> 极大型指标
%
% y = mid2max(x, best)
%
% x         指标向量
% best      最佳指标（中间量）
%

x_best = max(abs(x - best));
y = 1 - abs(x - best)/x_best;

end