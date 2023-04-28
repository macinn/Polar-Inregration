 fprintf("Program wyświetla wykres zależności średniego błędu kwadratury\n" + ...
 "od liczby węzłów kwadratury. Obliczane są losowo generowane całki\n" + ...
 "4 stopnia, istnieje możliwość wykonania testu dla metod zmodyfikowanych,\n" + ...
 "opisanych w sekcji Dodatek.\n")

clear, clf
% Maksymalne n_m (M), n_a (A) 
N=20;
% Ilość obliczanych całek
I=100;
% Generowanie macierzy błędów, w zależności od testu, zbędne zakomentować
ERR=zeros(N,N,I);
% ERR2=zeros(N,N,I);
% ERR3=zeros(N,N,I);
% ERR4=zeros(N,N,I); 
for q=1:I
    % Generowanie losowych wielomianów, wyrazy nie mające wpływu na wynik
    % pominięte
    c= rand(1,10)*10;
    f=@(x,y) +c(2)*x+c(3)*y+c(4)*x*y+c(5)*x*x+c(6)*y*y+c(7)*x*x*y*y+...
        c(8)*x*x*y*y+c(9)*x*x*x*x+c(10)*y*y*y*y;
    % Dokładna wartość całki
    IntVal = c(5)*pi/4+c(6)*pi/4+c(9)*pi/8+c(10)*pi/8+c(7)*pi/24+c(8)*pi/24;
    % Zapełnianie macierzy błędu dla badanej metody
    for k=1:N
        for l=1:N
            ERR(k,l,q)=abs(P1Z36_MSK_polarInt(f,k,l)-IntVal);
            ERR(k,l,q)=ERR(k,l,q)*l*l;
            ERR(k,l,q)=log10(ERR(k,l,q));
        end
    end
% Zapełnianie macierzy błędu dla zmodyfikowanych metod   
%     for i=1:N
%         for j=1:N
%             ERR2(i,j,q)=abs(zmodyfikowana(f,i,j)-IntVal);
%             ERR2(i,j,q)=ERR2(i,j,q)*j*j;
%             ERR2(i,j,q)=log10(ERR2(i,j,q));
%             disp(i)
%         end
%     end
%     for i=1:N
%         for j=1:N
%             ERR3(i,j,q)=abs(zmodyfikowana2(f,i,j)-IntVal);
%             ERR3(i,j,q)=ERR3(i,j,q)*j*j;
%             ERR3(i,j,q)=log10(ERR3(i,j,q));
%             disp(i)
%         end
%     end
%     for i = 1 : N
%         for j = 1 : N
%             ERR4(i,j,q) = abs(zmodyfikowana3(f, i, j) - IntVal);
%             ERR4(i,j,q)=ERR4(i,j,q)*j*j;
%             ERR4(i,j,q) = log10(ERR4(i, j, q));
%             disp(i)
%         end
%     end
end
% Uśrednianie błędów
for k = 1 : N
    for l = 1 : N
        ERR(k, l) = mean(ERR(k, l, :));
%         ERR2(k, l) = mean(ERR2(k, l, :));
%         ERR3(k, l) = mean(ERR3(k, l, :));
%         ERR4(k, l) = mean(ERR4(k, l, :));
    end
end

% Wyświetlanie błędu niezmodyfikowanej metody       
nexttile
hold on   
title("Błąd niezmodyfikowanej metody [log10]")
xlabel("n_a")
ylabel("n_m")
set(get(gca,'ylabel'),'rotation',0)
surf(ERR(:,:,1));
colormap parula
xlim([1 N]);
ylim([1 N]);
caxis([lowerbound upperbound])
view(2);
colorbar;

% Przy wyświetlaniu wielu wyników zmodyfikownych metod
% Ujednolicenie koloru przy porównywaniu danych
% lowerbound=min( [min(min(ERR2)), min(min(ERR3)), min(min(ERR4)) ]);
% upperbound=max( [max(max(ERR2)), max(max(ERR3)), max(max(ERR4)) ]);
% tiledlayout(1,3)
% nexttile
% hold on
% title("Błąd zmodyfikowanej metody 1 [log10]")
% xlabel("A")
% ylabel("M")
% set(get(gca,'ylabel'),'rotation',0)
% surf(ERR2);
% colormap parula
% xlim([1 N]);
% ylim([1 N]);
% caxis([lowerbound upperbound])
% view(2);
% h=colorbar;
% set(h,'ylim', [lowerbound max([lowerbound+1 0])])
% nexttile
% hold on
% title("Błąd zmodyfikowanej metody 2 [log10]")
% xlabel("A")
% ylabel("M")
% set(get(gca,'ylabel'),'rotation',0)
% surf(ERR3);
% colormap parula
% xlim([1 N]);
% ylim([1 N]);
% caxis([lowerbound upperbound])
% view(2);
% h=colorbar;
% set(h,'ylim', [lowerbound max([lowerbound+1 0])])
% nexttile
% hold on
% title("Błąd zmodyfikowanej metody 3 [log10]")
% xlabel("A")
% ylabel("M")
% set(get(gca,'ylabel'),'rotation',0)
% surf(ERR4);
% colormap parula
% xlim([1 N]);
% ylim([1 N]);
% caxis([lowerbound upperbound])
% view(2);
% h=colorbar;
% set(h,'ylim', [lowerbound max([lowerbound+1 0])])