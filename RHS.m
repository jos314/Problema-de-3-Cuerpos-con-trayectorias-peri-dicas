function zdot = RHS( t, z,p )

% Las posiciones son z(1:6), las velocidades son z(7:12)
% El parametro t lo usaremos cuando animemos las graficas 

a = accel(p.G,p.m1,p.m2,p.m3,z(1),z(3),z(5),z(2),z(4),z(6));

zdot = [z(7:12);a];

end
