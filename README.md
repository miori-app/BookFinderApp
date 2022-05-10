# BookFinderApp
Google BookAPI 를 활용해서, 책/ 작가 검색을 할 수 있는 

## 📚 구현 기능
- 책 혹은 작가 검색을 통해, 원하는 책의 정보를 얻을 수 있다
- 검색 결과를 무한 스크롤 하여, 계속 볼 수 있다
- [실행영상 유투브](https://youtu.be/YZweuStMRSc)

## 📱구현 환경
- Deployment Target iOS 13.0

iOS 13|iOS 14|iOS 15
---|---|---
작동확인|작동확인|작동확인

- darkMode 미지원
- Device Orientation : Portrait

## 🛠 개발 환경
### Package 버전 관리
- SPM(Swift Package Manager)
  ### 사용 라이브러리
    - Snapkit(5.0.1)
    - RxSwift (6.2.0)
    - Kingfisher (7.1.2)
    
### 디자인 패턴
- MVVM

---
## 📝 문서화
### 작업 방식
- 이슈/일정관리 : Jira 
- 문서화 : Confluence

### 개발 문서화
- [API Response](https://miori.atlassian.net/l/c/5AMx7qwH)
- [프로젝트 진행방식/결과/회고](https://miori.atlassian.net/l/c/T9dc4WnW)


---
## 🖇 사용한 API
- [Google Books API](https://developers.google.com/books/docs/overview)

## 회고
Rxswift 를 올해 2월 부터 공부하기 시작하였다.  그 동안 배운 것을 적용시켜보고자 RxSwift 로 과제를 진행하기로 하였다. 항상 swift 로 프로젝트를 진행했기 때문에 낯설었지만 하다보니 오히려 재미있었다.
해당 과제의 핵심인 검색기능이나, 무한스크롤 기능은 “쉐어홈트” 앱을 만들때 swift로 구현을 했던 기능들이었다. 이러한 기능들을 rxswift로도 구현을 하다보니 확연하게 장단점을 느낄 수 있었다.
첫번째,  Rxswift 에서 제공해주는 연산자를 잘 활용한다면, 직관적인 코드를 짤 수 있다는 점이다.
예를 들어, 무한스크롤 기능을 구현하는 단계에서 스크롤의 위치가 바닥에 닿았을때 reload를 하게 될것이다. 하지만 이때 중복적으로 reload 가 될 수 있다. 그냥 swift 로 구현할 때는 bool 값을 변경함으로써 이를 방지 했다.
하지만 rxswift를 사용할때는 , throttle 연산자를 통해 위와 같은 기능을 구현할 수 있었고 “아, 중복을 막는 코드구나” 라는 느낌이 팍 온다.

## Reference
- 해당 프로젝트는 원티드랩의 과제 프로젝트의 일부입니다


