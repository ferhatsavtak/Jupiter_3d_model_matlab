clc
clear all

% Jupiter y�zey haritas�n� oku
jupiter_map = flipud(imread('Jupiter-Map.jpg'));

% Jupiter'in yar��ap� (km)
radius = 71492;

% K�re olu�tur
[x, y, z] = sphere(100);

% Jupiter'in yar��ap�na g�re k�reyi �l�eklendir
x = x * radius;
y = y * radius;
z = z * radius;

% 3D modeli �iz
h_fig = figure('Position', [100 100 800 600]);
surface(x, y, z, 'FaceColor', 'texturemap', 'CData', jupiter_map, 'EdgeColor', 'none');
axis equal

% Eksenleri gizle
axis off

% Fare ile d�nd�rme etkinle�tir
rotate3d on

% Siyah arka plan� olu�tur
h_axes = gca;
set(h_axes, 'Color', 'none');
h_axes.Parent.Color = [0 0 0];

% Jupiter'in k�tlesi (kg)
mass = 1.8982e27;

% Jupiter'in yer�ekimi (m/s^2)
gravity = 24.79;

% Jupiter'in d�n�� s�resi (saat)
rotation_period = 9.9;

% Jupiter'in y�r�nge s�resi (D�nya y�l�)
orbital_period = 11.9;

% Jupiter'in ortalama s�cakl��� (C)
average_temperature = -185;

% Bilgileri ekranda g�ster
info_str = sprintf('Jupiter Bilgileri:\nK�tle: %.2e kg\nYer�ekimi: %.2f m/s^2\nD�n�� S�resi: %.1f saat\nY�r�nge S�resi: %.1f D�nya y�l�\nOrtalama S�cakl�k: %d C', ...
    mass, gravity, rotation_period, orbital_period, average_temperature);
annotation('textbox', [0.75, 0.5, 0.1, 0.1], 'String', info_str, 'FitBoxToText', 'on', 'BackgroundColor', 'white');


% Jupiter'in otomatik d�nd�r�lmesi
angle = 1;
while ishghandle(h_fig)
    view(angle, 30);
    pause(0.1);
    angle = angle + 1;
end

