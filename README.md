# D-Day 📅

macOS 메뉴바에서 실행되는 D-Day 카운트다운 앱입니다.  
A D-Day countdown app that runs in the macOS menu bar.

## ✨ 기능 (Features)

- **메뉴바 통합**: macOS 메뉴바에 D-Day 정보를 실시간으로 표시
- **진행률 계산**: 목표 날짜까지의 남은 일수와 진행률을 퍼센트로 표시
- **자동 업데이트**: 1시간마다 자동으로 D-Day 정보 갱신
- **백그라운드 실행**: 시스템 부하 없이 백그라운드에서 작동

- **Menu Bar Integration**: Real-time D-Day display in macOS menu bar
- **Progress Calculation**: Shows remaining days and progress percentage
- **Auto Update**: Automatically refreshes every hour
- **Background Operation**: Runs silently in the background

## 🖥 시스템 요구사항 (System Requirements)

- macOS 11.0 이상
- Xcode 12.0 이상 (개발용)

## 🚀 설치 및 실행 (Installation & Usage)

### 개발 환경에서 실행하기

1. 레포지토리를 클론합니다:
```bash
git clone https://github.com/your-username/d-day.git
cd d-day
```

2. Xcode로 프로젝트를 엽니다:
```bash
open d-day.xcodeproj
```

3. 프로젝트를 빌드하고 실행합니다 (⌘+R)

### 목표 날짜 변경하기

`d_dayApp.swift` 파일에서 `targetDateComponents` 변수를 수정하여 목표 날짜를 변경할 수 있습니다:

```swift
var targetDateComponents = DateComponents(year: 2025, month: 6, day: 19)
```

## 📱 스크린샷 (Screenshots)

메뉴바에 다음과 같이 표시됩니다:
```
42일 | 61.8%
```

## 🛠 기술 스택 (Tech Stack)

- **언어**: Swift
- **프레임워크**: SwiftUI, Cocoa
- **플랫폼**: macOS
- **아키텍처**: MVVM

## 📁 프로젝트 구조 (Project Structure)

```
d-day/
├── d-day/
│   ├── d_dayApp.swift          # 메인 앱 로직 및 메뉴바 통합
│   ├── ContentView.swift       # SwiftUI 뷰 (현재 미사용)
│   ├── Assets.xcassets/        # 앱 리소스
│   └── Info.plist             # 앱 정보 및 설정
├── d-dayTests/                # 단위 테스트
├── d-dayUITests/              # UI 테스트
└── README.md
```

## 🔧 주요 기능 구현 (Key Features)

### D-Day 계산 알고리즘
- 현재 날짜와 목표 날짜 간의 일수 차이 계산
- 전체 기간 대비 진행률을 퍼센트로 계산 (기본 110일 기준)

### 메뉴바 통합
- `NSStatusBar`를 사용한 시스템 메뉴바 통합
- `LSUIElement` 설정으로 독립 윈도우 없이 메뉴바에서만 실행

### 타이머 관리
- `Timer.scheduledTimer`를 사용한 주기적 업데이트
- 앱 종료 시 타이머 정리로 메모리 누수 방지

## 🤝 기여하기 (Contributing)

1. 이 레포지토리를 포크합니다
2. 새로운 기능 브랜치를 생성합니다 (`git checkout -b feature/AmazingFeature`)
3. 변경사항을 커밋합니다 (`git commit -m 'Add some AmazingFeature'`)
4. 브랜치에 푸시합니다 (`git push origin feature/AmazingFeature`)
5. Pull Request를 생성합니다

## 📄 라이선스 (License)

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.

## 👨‍💻 개발자 (Developer)

**김민수** - 초기 개발 및 유지보수

## 📮 연락처 (Contact)

프로젝트에 대한 질문이나 제안사항이 있으시면 이슈를 생성해주세요.

---

⭐ 이 프로젝트가 도움이 되셨다면 별표를 눌러주세요! 