fis = newfis('depósito');

fis = addvar(fis, 'input', 'Error', [-15, 15]);
fis = addmf(fis, 'input', 1, 'Negativo', 'trapmf', [-20, -15, -10, 0]);
fis = addmf(fis, 'input', 1, 'Cero', 'trimf',[-5, 0, 5]);
fis = addmf(fis, 'input', 1, 'Positivo', 'trapmf', [0, 10, 15, 15.0001]);

fis = addvar(fis, 'output', 'Apertura', [-25, 100]);
fis = addmf(fis, 'output', 1, 'Abierta', 'trapmf', [0, 50, 100, 120]);
fis = addmf(fis, 'output', 1, 'Cerrada', 'trimf', [-25, 0, 25]);

plotmf(fis,'input',1);
plotmf(fis,'output',1);

fis = addrule(fis,[1 2 1 1 ; 2 2 1 1 ; 3 1 1 1]);
showrule(fis);

ladoEmbalse = 10
baseEmbalse = ladoEmbalse * ladoEmbalse
alturaInicial = 19
alturaDeseada = 25
error = alturaDeseada - alturaInicial
apertura = evalfis(error, fis)
incrVol = (0.4 * (apertura / 100)) - 0.1
incrAlt = incrVol / baseEmbalse 
altura_f = alturaInicial + incrAlt