# MinGSwiftUILibrary

SwiftUILibrary는 UIKit의 유연함과 SwiftUI의 선언적 문법을 결합한 UI 컴포넌트 라이브러리입니다.

---

## 🧱 UIKitButton

`UIKitButton`은 **UIKit 기반의 UIButton을 SwiftUI처럼 사용할 수 있도록** 만든 커스텀 컴포넌트입니다.
기존 SwiftUI의 `Button`은 터치 가능한 영역이 기존 영역에서 조금 여백이 있는 곳까지 가능하도록 되어있으나,
정확한 경계선으로 영역제어를 하기 위해 만들어진 Button입니다.

---

### ✨ Example

```swift
import SwiftUILibrary
import SwiftUI

struct ContentView: View {
    var body: some View {
        UIKitButton(title: "확인")
            .onTap {
                print("Button tapped!")
            }
            .background(.black)
            .cornerRadius(8)
            
    }
}
```

---

### 💡 Description

| Modifier | Description |
|-----------|--------------|
| `.onTap(_ action: @escaping () -> Void)` | 버튼 탭 시 실행할 액션 설정 |

---

### 🚀 Features

- SwiftUI 문법으로 UIKit 컴포넌트 사용 가능  
- 커스텀 Modifier 체이닝 지원 (`.onTap`)  
- PressableButton을 기반으로 한 터치 애니메이션 내장  
- SwiftUI Preview에서도 동작 가능

---

### 🧩 Future Plan
  
- `.configuration(style:)` 형태의 커스텀 스타일 시스템 추가  

---

## 👨‍💻 Author

| Name | Contact |
|------|----------|
| 김민관 | [@songdealer](https://github.com/songdealer) |
