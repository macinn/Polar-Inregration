clc;
fprintf("Program testuje działanie metody na problematycznych funkcjach,\n" ...
    + "to znaczy, takich dla których miejsca węzłów kwadratury prostokątów\n" ...
    + "z punktem środkowym, jest wyjątkowo niekorzystne z perspektywy\n" ...
    + "przybliżenia wartości całki.");
pause
fprintf("\n\n");
f=@(x,y) (x-y)*(x-y)*(x+y)*(x+y);
funkcja = func2str(f);
funkcja = funkcja(7:end);
fprintf("Funkcja: %s, wartość dokładna: %6.4f\n", funkcja, pi/6);
fprintf("Funkcja ma wartośćci nieujemne na całym przedziale całkowania,\n" ...
    + "dla podziału modułu na  zbiory węzły kwadratury są miejscami zerowymi funkcji,\n" ...
    + "zatem spodziewanym przybliżeniem jest 0.\n");
fprintf("%25s Przybliżenia wartości\n", "")
fprintf("Liczba podziałów modułu   L. p. argumentu    Wartość przybliżona\n")
print(f,2,20);
print(f,3,20);
print(f,4,20);
print(f,5,20);
fprintf("\n");
pause
f=@(x,y) x^2;
funkcja = func2str(f);
funkcja = funkcja(7:end);
fprintf("Funkcja: %s, wartość dokładna: %6.4f\n", funkcja, pi/4);
fprintf("Liczba podziałów modułu   L. p. argumentu    Wartość przybliżona\n")
print(f,2,20);
print(f,3,20);
print(f,4,20);
print(f,5,20);
fprintf("\n");
pause
f=@(x,y) abs(x);
funkcja = func2str(f);
funkcja = funkcja(7:end);
fprintf("Funkcja: %s, wartość dokładna: %6.4f\n", funkcja, 4/3);
fprintf("%25s Przybliżenia wartości\n", "")
fprintf("Liczba podziałów modułu   L. p. argumentu    Wartość przybliżona\n")
print(f,2,20);
print(f,3,20);
print(f,4,20);
print(f,5,20);
pause
f=@(x,y) cos(pi * sqrt(x^2 + y^2));
funkcja = func2str(f);
funkcja = funkcja(7:end);
fprintf("Funkcja: %s, wartość dokładna: %6.4f\n", funkcja, 0);
fprintf("Przy podziale modułu na 1 zbiór powinniśmy otrzymać dokładny wynik,\n" ...
    + "ponieważ dla r=1/2 funkcja wartość funkcji to 0.\n");
fprintf("%25s Przybliżenia wartości\n", "")
fprintf("Liczba podziałów modułu   L. p. argumentu    Wartość przybliżona\n")
print(f,1,1);
print(f,20,1);
print(f,1,10);
print(f,20,10);
function print(f,a,b)
    fprintf("%23d %17d %22.4f\n",a,b, P1Z36_MSK_polarInt(f,a,b));
end