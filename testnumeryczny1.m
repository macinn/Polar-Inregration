clc;
fprintf("Program testuje poprawne działanie funkcji przybliżającej wartości kilku całek, \n" ...
    +"przy liczbie podziałów modułu i argumentu na 10 podzbiorów równej długości.\n\n")

funkcje = {@(x,y) 1, @(x,y) x, @(x,y) y, @(x,y) x*y ...
    @(x,y) x^2, @(x,y) y^2,@(x,y) x^4, @(x,y) y^4 @(x,y) x^81-y^29};
wyniki = [pi, 0, 0, 0, pi/4, pi/4, pi/8, pi/8, 0];

fprintf("Funkcja     Przybliżona wartość     Wartość dokładna         Błąd\n")
for i = 1 : size(funkcje, 2)
    funkcja = func2str(cell2mat(funkcje(i)));
    funkcja = funkcja(7 : end);
    val = P1Z36_MSK_polarInt(cell2mat(funkcje(i)), 10);
    fprintf("%10s %20.4f %20.4f %12.2e \n", funkcja, ...
        val, wyniki(i), abs(val - wyniki(i)));
end