clear all
close all

%% Zmienne
Edges = [ 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7;...
          4, 6, 3, 4, 5, 5, 6, 7, 5, 6, 4, 6, 4, 7, 6];

N = 7;
d = 0.85;
b = (1 - d)/N + zeros(N,1);

%% Liczenie mocierzy
B = sparse(Edges(2,:), Edges(1,:), ones(size(Edges(1,:))), N,N );
I = speye(N);
L = sum(B);
A = spdiags(1./L', 0, N,N);
M = I - d*B*A;

%% Zapis wyników do plików
delete('sparse_test.txt');
diary sparse_test.txt
whos A B I M b
diary off

figure;
axis equal
spy(B)
title('Reprezentacja graficzna rzadkiej macierzy B');
print -dpng spy_b

figure;
axis equal
r = M\b;
bar(r);
title('wartości PageRank dla poszczególnych stron');
xlabel('Strony');
ylabel('Współczynnik PageRank');
print -dpng bar