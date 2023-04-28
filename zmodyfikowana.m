function [int] = zmodyfikowana(f, A, M)
% Projekt 1, zadanie 36
% Marcin Skrzypczak, 320735
% 
% Funkcja przybliża wartość całki podwójnej, na przedziale
% { D \in R^2 : x^2 + y^2 <= 1 }, poprzez przekształcenie obszaru 
% całkowania na prostokąt [0, 1] x [0, 2\pi] oraz zastosowanie 
% złożonej kwadratury prostokątów z punktem środkowym. Zasada działania
% opisane w sekcji Dodatek.
% WEJŚCIE
%   f    - uchwyt do funkcji dwóch zmiennych, z której zostanie 
%          policzona całka
%   A    - liczba podziałów zbioru argumentów ([0, 2\pi]), zastosowana 
%          w złożonej kwadraturze prostokątów
%   M    - liczba podziałów zbioru modułów ([0, 1]), zastosowana 
%          w złożonej kwadraturze prostokątów
% WYJŚCIE  
%   int  - obliczone przybliżenie wartości całki

val=0;
for i=1:M
   for j=1:A*(2*i-1)
       r=(2*i-1)/2/M;
       phi=2*pi/(2*i-1)/A*j+pi/(2*i-1)/A;
       val=val+f(r*cos(phi),r*sin(phi))*pi/(M*M*A);
   end
end
int= val;

end %function