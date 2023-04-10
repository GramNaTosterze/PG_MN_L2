clear all
close all

%% Zmienne
n_max = 200;
a = 100;
r_max = a/2;

%% Rysowanie koła
figure;
n = 1;
x = zeros(1, n_max);
y = zeros(1, n_max);
r = zeros(1, n_max);
area = zeros(1, n_max);
c = zeros(1, n_max); % ilość prób rysowania 1 koła
while (n <= n_max)
    x(n) = a*rand(1);
    y(n) = a*rand(1);
    r_max = min([x(n), y(n), a - x(n), a - y(n)]);
    r(n) = r_max*rand(1);
    bool = true;
    for idx = 1:n-1 % Czy nie wchodzi na inne koła
        if sqrt((x(n) - x(idx))^2 + (y(n) - y(idx))^2) <= (r(n) + r(idx))
            bool = false;
        end
    end
    c(n) = c(n) + 1;
    if bool == true
        plot_circle(x(n),y(n),r(n));
        area(n) = pi*r(n)^2;  
        n = n + 1;
    end
    hold on
    pause(0.001)
end

axis equal
axis([0 a 0 a])
title('Pęcherzykowy kwadrat')
xlabel('x');
ylabel('y');

%% zad 1a
figure;
plot(cumsum(area));

title('Powierzchnia całkowita kół')
xlabel('Liczba narysowanych okręgów');
ylabel('Powierzchnia');

print -dpng zadanie1a

%% zad 1b
figure;
c_ = cumsum(c);
for idx = 1:n_max
    c_(idx) = c_(idx)/idx;
end
plot(c_);

title('Średnia liczba losowań')
xlabel('Liczba losowań');
ylabel('Liczba narysowanych okręgów');

print -dpng zadanie1b

%% funkcja plot_circle
function plot_circle(X, Y, R)
theta = linspace(0,2*pi);
x = R*cos(theta) + X;
y = R*sin(theta) + Y;
plot(x,y)
end