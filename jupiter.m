clc
clear all

% Jupiter yüzey haritasýný oku
jupiter_map = flipud(imread('Jupiter-Map.jpg'));

% Jupiter'in yarýçapý (km)
radius = 71492;

% Küre oluþtur
[x, y, z] = sphere(100);

% Jupiter'in yarýçapýna göre küreyi ölçeklendir
x = x * radius;
y = y * radius;
z = z * radius;

% 3D modeli çiz
h_fig = figure('Position', [100 100 800 600]);
surface(x, y, z, 'FaceColor', 'texturemap', 'CData', jupiter_map, 'EdgeColor', 'none');
axis equal

% Eksenleri gizle
axis off

% Fare ile döndürme etkinleþtir
rotate3d on

% Siyah arka planý oluþtur
h_axes = gca;
set(h_axes, 'Color', 'none');
h_axes.Parent.Color = [0 0 0];

% Jupiter'in kütlesi (kg)
mass = 1.8982e27;

% Jupiter'in yerçekimi (m/s^2)
gravity = 24.79;

% Jupiter'in dönüþ süresi (saat)
rotation_period = 9.9;

% Jupiter'in yörünge süresi (Dünya yýlý)
orbital_period = 11.9;

% Jupiter'in ortalama sýcaklýðý (C)
average_temperature = -185;

% Bilgileri ekranda göster
info_str = sprintf('Jupiter Bilgileri:\nKütle: %.2e kg\nYerçekimi: %.2f m/s^2\nDönüþ Süresi: %.1f saat\nYörünge Süresi: %.1f Dünya yýlý\nOrtalama Sýcaklýk: %d C', ...
    mass, gravity, rotation_period, orbital_period, average_temperature);
annotation('textbox', [0.75, 0.5, 0.1, 0.1], 'String', info_str, 'FitBoxToText', 'on', 'BackgroundColor', 'white');


% Jupiter'in otomatik döndürülmesi
angle = 1;
while ishghandle(h_fig)
    view(angle, 30);
    pause(0.1);
    angle = angle + 1;
end

