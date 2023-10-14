import APNGKit
import SwiftUI

public struct APNGPlayerView: UIViewRepresentable {
    let image: APNGImage

    public init(_ image: APNGImage) {
        self.image = image
    }

    public func makeUIView(context: Context) -> APNGImageView {
        APNGImageView()
    }

    public func updateUIView(_ imageView: APNGImageView, context: Context) {
        imageView.image = self.image
        imageView.startAnimating()
    }
}
