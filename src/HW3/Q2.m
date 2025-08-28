x = -1:0.01:1;
y1 = x.^3;
y2 = sin(x).^4;

figure;
plot(x, y1, 'b', 'LineWidth', 2);
hold on;
plot(x, y2, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('y');
legend('y=x^3', 'y=sin^4(x)');
title('Intersection of y=x^3 and y=sin^4(x)');
grid on;
