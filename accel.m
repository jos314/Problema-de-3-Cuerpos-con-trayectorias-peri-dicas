function a = accel(G,m1,m2,m3,x1,x2,x3,y1,y2,y3)

%Funcion para encontrar la aceleracion, r^{..}

p1 = [x1;y1];
p2 = [x2;y2];
p3 = [x3;y3];

% Vectores de 1 a 2; 1 a 3; 2 a 3
r1_2 = p2 - p1;
r1_3 = p3 - p1;
r2_3 = p3 - p2;

% Fuerza de 1 a 3
f1_3 = G*m1*m3/dot(r1_3,r1_3)*r1_3/norm(r1_3);
% Fuerza de 3 a 1
f3_1 = -f1_3;

% Fuerza de 2 a 3
f2_3 = G*m2*m3/dot(r2_3,r2_3)*r2_3/norm(r2_3);
% Fuerza de 3 a 2
f3_2 = -f2_3;

% Fuerza de 1 a 2
f1_2 = G*m1*m2/dot(r1_2,r1_2)*r1_2/norm(r1_2);
% Fuerza de 2 a 1
f2_1 = -f1_2;


a1 = (f1_2 + f1_3)/m1;
a2 = (f2_1 + f2_3)/m2;
a3 = (f3_1 + f3_2)/m3;


a = [a1;a2;a3];
end

