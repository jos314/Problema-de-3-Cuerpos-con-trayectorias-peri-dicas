function fig = animate( tarray,zarray,p )
% Dados los vectores tarray y zarray obtenidos de la funcion ode45
% queremos animar el movimiento de las particulas 

fig = figure;
fig.Position = [1000,100,800,800];

hold on
p1 = plot(0,0,'.','MarkerSize',50); 
p1cola = plot(0,0,'-','LineWidth',2,'Color',0.8*p1.Color);
p2 = plot(0,0,'.','MarkerSize',50);
p2cola = plot(0,0,'-','LineWidth',2,'Color',0.8*p2.Color);
p3 = plot(0,0,'.','MarkerSize',50);
p3cola = plot(0,0,'-','LineWidth',2,'Color',0.8*p3.Color);
hold off

axis([-2.2,2.2,-2.2,2.2]);

tact = 0;
tic;

while tact*p.tfactor < tarray(end)
    
    zact = interp1(tarray,zarray,tact*p.tfactor);
    
    % Actualiza posicion del punto
    p1.XData = zact(1);
    p1.YData = zact(2);
    
    p2.XData = zact(3);
    p2.YData = zact(4);
    
    p3.XData = zact(5);
    p3.YData = zact(6);
    
    % Actualiza la cola
    tind = find(tarray<tact*p.tfactor,1,'last');
    
    p1cola.XData = zarray(1:tind,1);
    p1cola.YData = zarray(1:tind,2);
    p2cola.XData = zarray(1:tind,3);
    p2cola.YData = zarray(1:tind,4);
    p3cola.XData = zarray(1:tind,5);
    p3cola.YData = zarray(1:tind,6);
    
    drawnow;
    
    tact = toc;
end
end
