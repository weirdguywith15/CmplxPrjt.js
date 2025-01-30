function draw_sierpinski_pyramid(vertices, level)
  if level == 0
    fill3(vertices(:,1), vertices(:,2), vertices(:,3), 'w');  % Plot the tetrahedron face
    hold on;
  else
    % Calculate midpoints of the tetrahedron edges
    mid12 = (vertices(1,:) + vertices(2,:)) / 2;
    mid13 = (vertices(1,:) + vertices(3,:)) / 2;
    mid14 = (vertices(1,:) + vertices(4,:)) / 2;
    mid23 = (vertices(2,:) + vertices(3,:)) / 2;
    mid24 = (vertices(2,:) + vertices(4,:)) / 2;
    mid34 = (vertices(3,:) + vertices(4,:)) / 2;

    % Recursively draw smaller tetrahedra
    draw_sierpinski_pyramid([vertices(1,:); mid12; mid13; mid14], level - 1);
    draw_sierpinski_pyramid([mid12; vertices(2,:); mid23; mid24], level - 1);
    draw_sierpinski_pyramid([mid13; mid23; vertices(3,:); mid34], level - 1);
    draw_sierpinski_pyramid([mid14; mid24; mid34; vertices(4,:)], level - 1);
  end
end

% Define the vertices of the initial large tetrahedron
v1 = [0, 0, 0];
v2 = [1, 0, 0];
v3 = [0.5, sqrt(3)/2, 0];
v4 = [0.5, sqrt(3)/6, sqrt(6)/3];

vertices = [v1; v2; v3; v4];

% Set recursion depth (number of levels of the pyramid)
level = 4;

% Plot the Sierpinski pyramid
figure;
draw_sierpinski_pyramid(vertices, level);
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
view(3);

