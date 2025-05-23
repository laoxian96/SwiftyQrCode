// The Swift Programming Language
// https://docs.swift.org/swift-book
import CoreImage.CIFilterBuiltins
import SwiftUI

public struct SwiftyQrCodeView: View {
    var text: String = ""
    var size: CGFloat = 200
    var color: Color = .primary

    public init(
        text: String = "",
        size: CGFloat = 200,
        color: Color = .primary
    ) {
        self.text = text
        self.size = size
        self.color = color
    }

    public var body: some View {
        Image(
            uiImage: generateQRCode(from: text)
        )
        .interpolation(.none)
        .resizable()
        .scaledToFit()
        .frame(width: size, height: size)
    }

    func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)

        filter.setValue(
            data,
            forKey: "inputMessage"
        )

        var qrImage = UIImage()

        let transform = CGAffineTransform(scaleX: 2, y: 2)

        if let outputImage = filter.outputImage?.transformed(
            by: transform
        ) {
            if context.createCGImage(
                outputImage,
                from: outputImage.extent
            ) != nil {
                let maskFilter = CIFilter.blendWithMask()
                maskFilter.maskImage = outputImage.applyingFilter("CIColorInvert")
                maskFilter.inputImage = CIImage(
                    color: CIColor(
                        color: UIColor(color)
                    )
                )

                let lightCIImage = maskFilter.outputImage!

                let lightImage = context.createCGImage(
                    lightCIImage,
                    from: lightCIImage.extent
                )
                .map(UIImage.init)!

                qrImage = lightImage
            }
        }
        return qrImage
    }
}

#Preview {
    SwiftyQrCodeView(text: "")
}
