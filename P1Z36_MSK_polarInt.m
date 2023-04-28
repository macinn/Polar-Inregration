function [int] = P1Z36_MSK_polarInt(f, n_a, n_m)
% Projekt 1, zadanie 36
% Marcin Skrzypczak, 320735
% 
% Funkcja przybliża wartość całki podwójnej, na przedziale
% { D \in R^2 : x^2 + y^2 <= 1 }, poprzez przekształcenie obszaru 
% całkowania na prostokąt [0, 1] x [0, 2\pi] oraz zastosowanie 
% złożonej kwadratury prostokątów z punktem środkowym.
% WEJŚCIE
%   f    - uchwyt do funkcji dwóch zmiennych, z której zostanie 
%          policzona całka
%   n_a  - liczba podziałów zbioru argumentów ([0, 2\pi]), zastosowana 
%          w złożonej kwadraturze prostokątów, domyślna wartość 10
%   n_m  - liczba podziałów zbioru modułów ([0, 1]), zastosowana 
%          w złożonej kwadraturze prostokątów, jeśli nie podana n_m = n_a
% WYJŚCIE  
%   int  - obliczone przybliżenie wartości całki

switch nargin
    case 1
        n_a = 10;
        n_m = 10;
    case 2
        n_m = n_a;
end
ArgOffset = pi / n_a;
ModOffset = 1 / 2 / n_m;
Args = linspace(ArgOffset, 2 * pi - ArgOffset, n_a);
Args = repmat(Args, n_m, 1);
Mods = linspace(ModOffset, 1 - ModOffset, n_m)';
Mods = repmat(Mods, 1, n_a);
% Dzięki przechowywaniu współrzędnych punktów jako tablica komóre
% oraz zastosowaniu cellfun(), możliwa jest obsługa funkcji
% nieprzystosowanych od operacji macierzowych
C = cat(3, Mods, Args);
C = num2cell(C, 3);
g = @(X) X(1) * f(X(1) *cos(X(2)), X(1) * sin(X(2)));
A=cellfun(g,C);
int = sum(A, 'all') * 2 * pi / n_a / n_m;

end % function