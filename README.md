# ImageProcessing
영상처리를 통한 라벨분류
## 목표
특징점 검출을 통한 상표 인식, 인식을 통해서 그 상표에 대한 정보를 알 수 있게함.
## Block Diagram
![Image01](https://qmx5sg.ch.files.1drv.com/y4mhbl7NGbsX0y2PYJ1wsOfnzMpAcMWvMRMEvgv8F6mh1vkpaomn7Hvz0J3fkYIzkNX6Jt2-JO3uxJSTIu1Adm8mVSrOKGxPnsi-7_omzS-nzx9QnRFUlcFj4Rm8PvUHDbYowCjFOVkTA7zZSbZmj7TE9TheVseuQjTnVOH7Ku6qQ9eKU790F7M6hftA-vzTIBr0K9er4N32y2DAazbzWqXFA?width=781&height=436&cropmode=none)<br>

## 주요 코드
- freshlogopoint = detectSURFFeatures(freshlogoimggray);
testcode.m file 18번째줄

- [freshlogofeature, freshlogopoint] = extractFeatures(freshlogoimggray, freshlogopoint)
testcode.m file 25번째줄

- freshpairs = matchFeatures(freshlogofeature, testfeature);
testcode.m file 33번째줄

- freshmatchedlogopoint = freshlogopoint(freshpairs(:, 1), :);
testcode.m file 38번째줄

## 성공한 결과(21장)
![Image02](https://q2x5sg.ch.files.1drv.com/y4mHnAvArVjUEpZQyVMFhSrmwXikCDkcuknEoUa2VSFYCAHS4gK8T2FLCtVCMKJd_UJ9dOzi189aujDreSAIa4GiIunIOpKoiPnPXjjYvyCepfFWGEeVCrkL6e999MBmnMWE3HO7_y6EZ6T734N8L7UyM_bbzRjsthMppvwuCWGeT5DF8l_RNWEcN7VPt19hmpaGUnARCkkYVBmngwAJGqEhg?width=660&height=590&cropmode=none)<br>
![Image03](https://rgx5sg.ch.files.1drv.com/y4mpTICXm9cB8i9bUy38P55Tg5CkB45NWrMQDV8ytyISqSGDIc_eVZLlDD45FFjTKSPe2DzfYW0CzxLmtq5P1sQ-XqPoocHOc0TrYanA3Mdp_bbFz_sjVJC0OWpZNylX5FnzAYr0aYlMChkHffBYEuIe16ezLuVB1XRUhyiO-4hZJkSf_EYI5jpbWlTwkUmdDGXdMYV4GRPhQY2UAiwGs8aVg?width=622&height=660&cropmode=none)<br>
![Image04](https://o2ze1q.ch.files.1drv.com/y4mFypMm4yDKfgcovqmIvJq2GaMoKipVOU6KAZYRiGJCiAMMy5pSQa1tvvMQaP572gKb1se682VqaAKE4RV8j0ZMowo8DbgB3Ux3q4L3QY3RtLePrM7-wkHorTlYpWYbB_WJELT_mDTG3GtzXsEoYp-5KfHegBTDeUMjTQqhmwEyMgz00WyPFl1eDDcMUBS0Ow1Ysxq_0v80is8SBiFf6shng?width=615&height=660&cropmode=none)<br>
![Image05](https://pgze1q.ch.files.1drv.com/y4mOTk1W4KpbOzCE2JMzr-o5Ctp4Uk2s1Cv2kZ10wxmFsZrlRLKzwmfea3aYruwetzXHyw5XGiGyKfMmU2C2rt26XrsdZ9M6YYdxV5RkyaMBPveLRMBJa5X5RVENwKaycbLYWOC58YbL61lJ_1FGG0G2Y6OxYr4V14jy41UJLJCYfY2N3LW2NoeoBYeliWGcd55_16h3P7TsuxclahCxq3gPw?width=660&height=498&cropmode=none)<br>
