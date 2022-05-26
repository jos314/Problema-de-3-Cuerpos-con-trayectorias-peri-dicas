% Problema de 3 cuerpos

close all; clear all

%%%% Parametros del sistema %%%%
p.G = 1;
p.m1 = 1;
p.m2 = 1;
p.m3 = 1;

%%% Condiciones iniciales  %%%
%[tend,inits] representa el tiempo por periodo, y un vector con condiciones iniciales
% [x1,y1,x2,y2,...,vx1,vy1,vx2,...]

NumeroSol = 2 ; % Numero de la solucion preprogramada % De 1 a 17
CI = 1;

switch CI
    case 1
        %%% Estas condiciones iniciales NO son las estudiadas en el articulo %%%
        [tend,inits] = getSolutionNum(NumeroSol); 
     
    case 2
        %%% Estas SI son algunas de las soluciones en el articulo %%%
        tend = 2.1740969264;
        inits = [-0.5,0,0.5,0,0.0207067154,0.3133550361, 0,0,0,0,0,0];
        
    case 3
        %%% Estas SI son algunas de las soluciones en el articulo %%%
        tend = 1.8286248401;
        inits = [-0.5,0,0.5,0,0.0009114239,0.3019805958, 0,0,0,0,0,0];
        p.m2=.8;
        p.m3=.8;
        
    otherwise
        error('Solucion invalida');
end

% Visualizador
p.tfactor = .5; % Factor de velocidad del vis
NumeroPeriodos = 5; % Periodos a correr


% opciones del odeset
p.odeOpts = odeset;
p.odeOpts.RelTol = 1e-10;
p.odeOpts.AbsTol = 1e-10;


%Llamamos al integrador ode45 con la funcion RHS usando los parametros especificados
[t,x] = ode45(@RHS,[0,NumeroPeriodos*tend],inits,p.odeOpts,p); 


figure(1)
plot(x(:,1),x(:,2))
xlabel('x') 
ylabel('y')
hold on
plot(x(:,3),x(:,4))
xlabel('x') 
ylabel('y')
hold on
plot(x(:,5),x(:,6))
xlabel('x') 
ylabel('y')
hold off

% Funciones para animar las soluciones :

animate(t,x,p);