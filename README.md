# SwiftyBlur Effect

This SwiftUI Component can create a qrcode view.

## Requirement

iOS 15+

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/laoxian96/SwiftyQrCode.git", branch: "main")
]
```

## Usage

```swift
struct SwiftyQrCodePreview: View {
    var body: some View {
        SwiftyQrCodeView(
            text: "Hello, World",
            size: 200,
            color: .blue
        )
    }
}

#Preview {
    SwiftyQrCodePreview()
}
```

## Preview

![preview](https://laoxian96.github.io/SwiftyQrCode/qrcode-preview.png)
