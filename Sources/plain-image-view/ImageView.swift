import SwiftUI

public struct ImageView: View {
  var image: UIImage?

  public init(image: UIImage? = nil) {
    self.image = image
  }

  public var body: some View {
    content()
  }

#if !os(tvOS)
  @ViewBuilder
  func content() -> some View {
    if let image = image {
      Image(uiImage: image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .scaledToFit()
        .cornerRadius(5)
    }
    else {
      Image(uiImage: UIImage(systemName: "photo")!)
        .resizable()
        .scaledToFill()
        .cornerRadius(10)
        .padding(5)
        .redacted(reason: .placeholder)
    }
  }
#endif

#if os(tvOS)
  @ViewBuilder
  func content() -> some View {
    Rectangle()
      .aspectRatio(1, contentMode: .fill)
      .overlay {
        if let image = image {
          Image(uiImage: image)
            .resizable()
            .scaledToFill()
        }
        else {
          Image(uiImage: UIImage(systemName: "photo")!)
            .resizable()
            .scaledToFill()
            .cornerRadius(10)
            .padding(5)
            .redacted(reason: .placeholder)
        }
      }
      .cornerRadius(5)
  }
#endif
}
