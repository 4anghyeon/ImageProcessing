%�̹��� �ҷ����� 
freshlogoimg = imread('freshlogo.jpg'); %���̽�
firstlogoimg = imread('firstlogo.jpg'); %ó��ó��
gooddaylogoimg = imread('gooddaylogo.jpg'); %��������
hallalogoimg = imread('hallalogo.jpg'); %�Ѷ��

testimg = imread('testimg3.jpg');

%rgb to gray
freshlogoimggray = rgb2gray(freshlogoimg); %���̽�
firstlogoimggray = rgb2gray(firstlogoimg); %ó��ó��
gooddaylogoimggray = rgb2gray(gooddaylogoimg);%��������
hallalogoimggray = rgb2gray(hallalogoimg); %�Ѷ��

testimggray = rgb2gray(testimg);

%Ư¡�� ���� & ����
freshlogopoint = detectSURFFeatures(freshlogoimggray); %���̽�
firstlogopoint = detectSURFFeatures(firstlogoimggray); %ó��ó��
gooddaylogopoint = detectSURFFeatures(gooddaylogoimggray); %��������
hallalogopoint = detectSURFFeatures(hallalogoimggray); %�Ѷ��

testpoint = detectSURFFeatures(testimggray);

[freshlogofeature, freshlogopoint] = extractFeatures(freshlogoimggray, freshlogopoint); %���̽�
[firstlogofeature, firstlogopoint] = extractFeatures(firstlogoimggray, firstlogopoint); %ó��ó��
[gooddaylogofeature, gooddaylogopoint] = extractFeatures(gooddaylogoimggray, gooddaylogopoint); %��������
[hallalogofeature, hallalogopoint] = extractFeatures(hallalogoimggray, hallalogopoint); %�Ѷ��

[testfeature, testpoint] = extractFeatures(testimggray, testpoint);

%��Ī
freshpairs = matchFeatures(freshlogofeature, testfeature); %���̽�
firstpairs = matchFeatures(firstlogofeature, testfeature); %ó��ó��
gooddaypairs = matchFeatures(gooddaylogofeature, testfeature); % ��������
hallapairs = matchFeatures(hallalogofeature, testfeature); %�Ѷ��

freshmatchedlogopoint = freshlogopoint(freshpairs(:, 1), :); %���̽�
firstmatchedlogopoint = firstlogopoint(firstpairs(:, 1), :); %ó��ó��
gooddaymatchedlogopoint = gooddaylogopoint(gooddaypairs(:,1),:); %��������
hallamatchedlogopoint = hallalogopoint(hallapairs(:,1),:); %�Ѷ��

if size(freshpairs,1) > 3
freshmatchedtestpoint = testpoint(freshpairs(:, 2), :);
[tform, ~, ~,status1] = ...
    estimateGeometricTransform(freshmatchedlogopoint, freshmatchedtestpoint, 'affine'); %���̽�

freshboxPolygon = [1, 1;...                         
        size(freshlogoimggray, 2), 1;...                
        size(freshlogoimggray, 2), size(freshlogoimggray, 1);... 
        1, size(freshlogoimggray, 1);...                
        1, 1];  
newfreshBoxPolygon = transformPointsForward(tform, freshboxPolygon); %���̽�
else
end


if size(firstpairs,1) > 3
firstmatchedtestpoint = testpoint(firstpairs(:, 2), :);
[tform1, ~, ~,status2] = ...
    estimateGeometricTransform(firstmatchedlogopoint, firstmatchedtestpoint, 'affine'); %ó��ó��

firstboxPolygon = [1, 1;...                         
        size(firstlogoimggray, 2), 1;...                
        size(firstlogoimggray, 2), size(firstlogoimggray, 1);... 
        1, size(firstlogoimggray, 1);...                
        1, 1];  
newfirstBoxPolygon = transformPointsForward(tform1, firstboxPolygon); %ó��ó��
else
end

if size(gooddaypairs,1) > 3
gooddaymatchedtestpoint = testpoint(gooddaypairs(:, 2), :);
[tform2, ~, ~,status3] = ...
    estimateGeometricTransform(gooddaymatchedlogopoint, gooddaymatchedtestpoint, 'affine'); %��������

gooddayboxPolygon = [1, 1;...                         
        size(gooddaylogoimggray, 2), 1;...                
        size(gooddaylogoimggray, 2), size(gooddaylogoimggray, 1);... 
        1, size(gooddaylogoimggray, 1);...                
        1, 1];  
newgooddayBoxPolygon = transformPointsForward(tform2, gooddayboxPolygon); %��������
else
end


if (size(hallapairs,1) >= 3)
hallamatchedtestpoint = testpoint(hallapairs(:, 2), :);
[tform3, ~, ~,status4] = ...
    estimateGeometricTransform(hallamatchedlogopoint, hallamatchedtestpoint, 'affine'); %�Ѷ��

hallaboxPolygon = [1, 1;...                         
        size(hallalogoimggray, 2), 1;...                
        size(hallalogoimggray, 2), size(hallalogoimggray, 1);... 
        1, size(hallalogoimggray, 1);...                
        1, 1];  
newhallaBoxPolygon = transformPointsForward(tform3, hallaboxPolygon); %�Ѷ��

else
end

%���
figure;
imshow(testimg);
hold on;
if size(freshpairs,1) > 3
if size(freshmatchedtestpoint,1) >=20
line(newfreshBoxPolygon(:, 1), newfreshBoxPolygon(:, 2), 'Color', 'y');
freshx = double(newfreshBoxPolygon(1,1));
freshy = double(newfreshBoxPolygon(1,2));
 text(freshx,freshy ,'���̽� FRESH','Fontsize',18) %���̽�
else
end
end

if size(firstpairs,1) > 3
if size(firstmatchedtestpoint,1) >=20
line(newfirstBoxPolygon(:, 1), newfirstBoxPolygon(:, 2), 'Color', 'r');
firstx = double(newfirstBoxPolygon(1,1));
firsty = double(newfirstBoxPolygon(1,2));
 text(firstx,firsty ,'ó��ó��','Fontsize',18) %ó��ó��
else
end
end

if size(gooddaypairs,1) > 3
if size(gooddaymatchedtestpoint,1) >=20
 line(newgooddayBoxPolygon(:, 1), newgooddayBoxPolygon(:, 2), 'Color', 'b');
gooddayx = double(newgooddayBoxPolygon(1,1));
gooddayy = double(newgooddayBoxPolygon(1,2));
 text(gooddayx,gooddayy ,'��������','Fontsize',18) %��������
else
end
end

if (size(hallapairs,1) >= 3)
if size(hallamatchedtestpoint,1) >=20
 line(newhallaBoxPolygon(:, 1), newhallaBoxPolygon(:, 2), 'Color', 'g');
hallax = double(newhallaBoxPolygon(1,1));
hallay = double(newhallaBoxPolygon(1,2));
 text(hallax,hallay ,'�Ѷ��','Fontsize',18) %�Ѷ��
else
end
end


