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

## 실패한 결과 (9장)

![Image06](https://pwze1q.ch.files.1drv.com/y4m8mHqLBBSkEv2HewxEeng2x1pLd2_FE5neKoX4_UcAau1ldJyHv3Y73ZU7O_foLP5ZXYIvifgR24m4oopJDy7XOhe_VUTbJP-BVDjjHag3266bVHw8CkNxf4SKPBRb_7b5o7DXwSqOejwTCzTjXaX2N_30AXo3p5DzdkyFYWXbmPPPGvtQLXGVNPmFTIVMriC2kqow4m7PHdvsXCBM_z5fw?width=561&height=660&cropmode=none)<br>
![Image07](https://pmze1q.ch.files.1drv.com/y4mpPNxNO05m3OIY5QAtdv_etWQ4oeG8Noe_QWNTTf_emWRV7LhJGd_iKHwqA2fk9mSzU2yJ9UzwmXdVexE9Kld4V9R7iF6X17n1bMxCWGomA1C61Mb0iFRgYbQBQOXlfNKgi5ghT5tffxzoSytITPiDSh_N9Fiot3nYmRmnFJweZ7W_qqZeTYnboFnxha1Z9nNOowN8oB2Yi1iiKu0qYGNMg?width=622&height=660&cropmode=none)<br>

## 결론
-	총 30개의 시험중 21하나의 결과가 성공 하였다. (70%)
-	실패한 이유로는 첫째로 처음 로고에서 특징점을 얻었는데 그 로고의 이미지 파일이 부적절했을 수 있다. 또 테스트이미지의 크기가 너무 크거나 작을 경우 인식이 안됐을 수 있다. 
-	이러한 결과를 통해서 한라산같이 특징점이 많은 이미지의 경우에서 더 성공확률이 높은 것을 볼 수 있었고, 처음처럼과 좋은데이같이 서로 비슷하게 생긴 경우에는 오류가 발생할 확률이 좀 더 크게 나타났다.

### 참조
https://kr.mathworks.com/help/vision/examples/object-detection-in-a-cluttered-scene-using-point-feature-matching.html
