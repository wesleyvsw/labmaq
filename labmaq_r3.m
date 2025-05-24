%Dados coletados
%Ensaio a vazio
i_campo_vazio = [0 1.08 2.17 3.21 4.11 5 6.15 7.34 8.08 9.05 10.05 12.21 14.19];
v_armadura = [5.87 22.06 42.35 61.4 76.2 89.2 103.8 115.6 121.6 128.5 134.6 144.8 152.5];
%Ensaio de curto circuito
i_campo_cc = [0 0.5 1 1.52 2.05 2.5 3.02];
i_armadura = [1.3 3.6 6.05 8.46 11.15 13.24 15.66];
%Plot dos curvas cav e ccc
%Vazio
figura1 = figure;
plot(i_campo_vazio,v_armadura, 'x')
title('Corrente de Campo x Tensão de armadura')
xlabel('Corrente de campo (A)')
ylabel('Tensão de armadura (V)')
grid on
%polyfit para encontrar a linha de entreferro
poli_vazio = polyfit(i_campo_vazio(1:5),v_armadura(1:5),1);
n = 0:0.01:15;
reta = polyval(poli_vazio,n)
close(figura1)

figura2 = figure;
plot(i_campo_vazio, v_armadura, 'x', 'DisplayName', 'Todos os dados')
hold on
plot(i_campo_vazio, v_armadura, '-', 'DisplayName', 'Curva ajustada')
plot(n, reta, 'k-', 'DisplayName', 'Linha do entreferro')
hold off
title('Corrente de Campo x Tensão de armadura')
xlabel('Corrente de campo (A)')
ylabel('Tensão de armadura (V)')
grid on
legend('Location', 'best')
close(figura2)
%Ensaio de curto Circuito
%Figura
poli_cc = polyfit(i_campo_cc,i_armadura,1);
n1 = 0:0.01:3;
reta_cc = polyval(poli_cc,n1)

figura2 = figure;
plot(i_campo_cc, i_armadura, 'x', 'DisplayName', 'Todos os dados')
hold on
plot(n1, reta_cc, 'k-', 'DisplayName', 'Curva ajustada')
hold off
title('Corrente de Campo x Corrente de armadura')
xlabel('Corrente de campo (A)')
ylabel('Corrente de armadura (A)')
grid on
legend('Location', 'best')

