# ImageProcessing
영상처리를 통한 라벨분류
## 목표
특징점 검출을 통한 상표 인식, 인식을 통해서 그 상표에 대한 정보를 알 수 있게함.
## Block Diagram
![Image01](https://qmx5sg.ch.files.1drv.com/y4mhbl7NGbsX0y2PYJ1wsOfnzMpAcMWvMRMEvgv8F6mh1vkpaomn7Hvz0J3fkYIzkNX6Jt2-JO3uxJSTIu1Adm8mVSrOKGxPnsi-7_omzS-nzx9QnRFUlcFj4Rm8PvUHDbYowCjFOVkTA7zZSbZmj7TE9TheVseuQjTnVOH7Ku6qQ9eKU790F7M6hftA-vzTIBr0K9er4N32y2DAazbzWqXFA?width=781&height=436&cropmode=none)<br>

## 주요 코드
- freshlogopoint = detectSURFFeatures(freshlogoimggray);
testcode.m file 18번째줄

[freshlogofeature, freshlogopoint] = extractFeatures(freshlogoimggray, freshlogopoint)
testcode.m file 25번째줄

freshpairs = matchFeatures(freshlogofeature, testfeature);
testcode.m file 33번째줄

freshmatchedlogopoint = freshlogopoint(freshpairs(:, 1), :);
testcode.m file 38번째줄
