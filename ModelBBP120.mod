param n; #número de itens

param m; #número de caixas

param C; #capacidade das caixas

param p {i in 1..m}; #vetor de pesos dos itens

#variáveis de decisão

var x {1..m, 1..n} binary;  # x[i,j] = 1 se o item j for colocado no bin i, 0 caso contrário
var y {1..m} binary;  # y[i] = 1 se o bin i for usado, 0 caso contrário

#função objetivo
minimize Numerodecaixas: sum{i in 1..m} y[i];

#restrições

subject to Capacidadedacaixa{i in 1..m}:
	sum{j in 1..n} p[j]*x[i,j]<=C*y[i];
	
subject to UmItemPorCaixa{j in 1..n}:
    sum{i in 1..m} x[i,j] = 1;



