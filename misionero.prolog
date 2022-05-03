%================================================================================
%  3 misiones y 3 caníbales. 
%  
%  Miguel Eduardo Jaime Velázquez
%  Fundamentos de Inteligencia Artificial
%================================================================================
%
%  La barca disponible sólo tiene capacidad para 2 ocupantes incluyendo
%  el remero y, tanto misioneros como caníbales pueden remar. En ningún
%  momento deben encontrarse, en orilla alguna, mas caníbales que
%  misioneros (para eviar que ocurra canibalismo).
%
%
%================================================================================

% Estado inicial/5, donde los primeros dos numeros son el origen y la
% orilla, los dos siguientes son la otra orilla destino, el último es
% el origen
edo_inicial([3,3,0,0,o]).

% Estado meta/5, donde los primeros dos numeros son el origen y la
% orilla, los dos siguientes son la otra orilla destino, el último es
% el destino
edo_meta([0,0,3,3,d]).

% Movimientos: Se muestran las reglas del juego para evitar que los
% misioneros sean comidos.

movimiento([MO,CO,MD,CD,L1], [MO2,CO2,MD2,CD2,L2]):-

% Un misionero
((MO2 is MO-1,CO2 is CO,MD2 is MD+1,CD2 is CD,L1='o',L2='d');
(MO2 is MO-2,CO2 is CO,MD2 is MD+2,CD2 is CD,L1='o',L2='d');

 % Dos misioneros
(MO2 is MO-2,CO2 is CO,MD2 is MD+2,CD2 is CD,L1='o',L2='d');
(MO2 is MO+2,CO2 is CO,MD2 is MD-2,CD2 is CD,L1='d',L2='o');

 % Misionero y caníbal
(MO2 is MO-1,CO2 is CO-1,MD2 is MD+1,CD2 is CD+1,L1='o',L2='d');
(MO2 is MO+1,CO2 is CO+1,MD2 is MD-1,CD2 is CD-1,L1='d',L2='o');

 % Un canibal
(MO2 is MO,CO2 is CO-1,MD2 is MD,CD2 is CD+1,L1='o',L2='d');
(MO2 is MO,CO2 is CO+1,MD2 is MD,CD2 is CD-1,L1='d',L2='o');

 % Dos caníbales
(MO2 is MO,CO2 is CO-2,MD2 is MD,CD2 is CD+2,L1='o',L2='d');
(MO2 is MO,CO2 is CO+2,MD2 is MD,CD2 is CD-2,L1='d',L2='o')),
edo_válido([MO2,CO2,MD2,CD2]).

