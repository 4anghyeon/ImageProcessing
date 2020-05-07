%이미지 불러오기 
freshlogoimg = imread('freshlogo.jpg'); %참이슬
firstlogoimg = imread('firstlogo.jpg'); %처음처럼
gooddaylogoimg = imread('gooddaylogo.jpg'); %좋은데이
hallalogoimg = imread('hallalogo.jpg'); %한라산

testimg = imread('testimg3.jpg');

%rgb to gray
freshlogoimggray = rgb2gray(freshlogoimg); %참이슬
firstlogoimggray = rgb2gray(firstlogoimg); %처음처럼
gooddaylogoimggray = rgb2gray(gooddaylogoimg);%좋은데이
hallalogoimggray = rgb2gray(hallalogoimg); %한라산

testimggray = rgb2gray(testimg);

%특징점 감지 & 추출
freshlogopoint = detectSURFFeatures(freshlogoimggray); %참이슬
firstlogopoint = detectSURFFeatures(firstlogoimggray); %처음처럼
gooddaylogopoint = detectSURFFeatures(gooddaylogoimggray); %좋은데이
hallalogopoint = detectSURFFeatures(hallalogoimggray); %한라산

testpoint = detectSURFFeatures(testimggray);

[freshlogofeature, freshlogopoint] = extractFeatures(freshlogoimggray, freshlogopoint); %참이슬
[firstlogofeature, firstlogopoint] = extractFeatures(firstlogoimggray, firstlogopoint); %처음처럼
[gooddaylogofeature, gooddaylogopoint] = extractFeatures(gooddaylogoimggray, gooddaylogopoint); %좋은데이
[hallalogofeature, hallalogopoint] = extractFeatures(hallalogoimggray, hallalogopoint); %한라산

[testfeature, testpoint] = extractFeatures(testimggray, testpoint);

%매칭
freshpairs = matchFeatures(freshlogofeature, testfeature); %참이슬
firstpairs = matchFeatures(firstlogofeature, testfeature); %처음처럼
gooddaypairs = matchFeatures(gooddaylogofeature, testfeature); % 좋은데이
hallapairs = matchFeatures(hallalogofeature, testfeature); %한라산

freshmatchedlogopoint = freshlogopoint(freshpairs(:, 1), :); %참이슬
firstmatchedlogopoint = firstlogopoint(firstpairs(:, 1), :); %처음처럼
gooddaymatchedlogopoint = gooddaylogopoint(gooddaypairs(:,1),:); %좋은데이
hallamatchedlogopoint = hallalogopoint(hallapairs(:,1),:); %한라산

if size(freshpairs,1) > 3
freshmatchedtestpoint = testpoint(freshpairs(:, 2), :);
[tform, ~, ~,status1] = ...
    estimateGeometricTransform(freshmatchedlogopoint, freshmatchedtestpoint, 'affine'); %참이슬

freshboxPolygon = [1, 1;...                         
        size(freshlogoimggray, 2), 1;...                
        size(freshlogoimggray, 2), size(freshlogoimggray, 1);... 
        1, size(freshlogoimggray, 1);...                
        1, 1];  
newfreshBoxPolygon = transformPointsForward(tform, freshboxPolygon); %참이슬
else
end


if size(firstpairs,1) > 3
firstmatchedtestpoint = testpoint(firstpairs(:, 2), :);
[tform1, ~, ~,status2] = ...
    estimateGeometricTransform(firstmatchedlogopoint, firstmatchedtestpoint, 'affine'); %처음처럼

firstboxPolygon = [1, 1;...                         
        size(firstlogoimggray, 2), 1;...                
        size(firstlogoimggray, 2), size(firstlogoimggray, 1);... 
        1, size(firstlogoimggray, 1);...                
        1, 1];  
newfirstBoxPolygon = transformPointsForward(tform1, firstboxPolygon); %처음처럼
else
end

if size(gooddaypairs,1) > 3
gooddaymatchedtestpoint = testpoint(gooddaypairs(:, 2), :);
[tform2, ~, ~,status3] = ...
    estimateGeometricTransform(gooddaymatchedlogopoint, gooddaymatchedtestpoint, 'affine'); %좋은데이

gooddayboxPolygon = [1, 1;...                         
        size(gooddaylogoimggray, 2), 1;...                
        size(gooddaylogoimggray, 2), size(gooddaylogoimggray, 1);... 
        1, size(gooddaylogoimggray, 1);...                
        1, 1];  
newgooddayBoxPolygon = transformPointsForward(tform2, gooddayboxPolygon); %좋은데이
else
end


if (size(hallapairs,1) >= 3)
hallamatchedtestpoint = testpoint(hallapairs(:, 2), :);
[tform3, ~, ~,status4] = ...
    estimateGeometricTransform(hallamatchedlogopoint, hallamatchedtestpoint, 'affine'); %한라산

hallaboxPolygon = [1, 1;...                         
        size(hallalogoimggray, 2), 1;...                
        size(hallalogoimggray, 2), size(hallalogoimggray, 1);... 
        1, size(hallalogoimggray, 1);...                
        1, 1];  
newhallaBoxPolygon = transformPointsForward(tform3, hallaboxPolygon); %한라산

else
end

%출력
figure;
imshow(testimg);
hold on;
if size(freshpairs,1) > 3
if size(freshmatchedtestpoint,1) >=20
line(newfreshBoxPolygon(:, 1), newfreshBoxPolygon(:, 2), 'Color', 'y');
freshx = double(newfreshBoxPolygon(1,1));
freshy = double(newfreshBoxPolygon(1,2));
 text(freshx,freshy ,'참이슬 FRESH','Fontsize',18) %참이슬
else
end
end

if size(firstpairs,1) > 3
if size(firstmatchedtestpoint,1) >=20
line(newfirstBoxPolygon(:, 1), newfirstBoxPolygon(:, 2), 'Color', 'r');
firstx = double(newfirstBoxPolygon(1,1));
firsty = double(newfirstBoxPolygon(1,2));
 text(firstx,firsty ,'처음처럼','Fontsize',18) %처음처럼
else
end
end

if size(gooddaypairs,1) > 3
if size(gooddaymatchedtestpoint,1) >=20
 line(newgooddayBoxPolygon(:, 1), newgooddayBoxPolygon(:, 2), 'Color', 'b');
gooddayx = double(newgooddayBoxPolygon(1,1));
gooddayy = double(newgooddayBoxPolygon(1,2));
 text(gooddayx,gooddayy ,'좋은데이','Fontsize',18) %좋은데이
else
end
end

if (size(hallapairs,1) >= 3)
if size(hallamatchedtestpoint,1) >=20
 line(newhallaBoxPolygon(:, 1), newhallaBoxPolygon(:, 2), 'Color', 'g');
hallax = double(newhallaBoxPolygon(1,1));
hallay = double(newhallaBoxPolygon(1,2));
 text(hallax,hallay ,'한라산','Fontsize',18) %한라산
else
end
end


