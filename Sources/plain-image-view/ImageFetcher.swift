import SwiftUI

public class ImageFetcher {
  public init() {}

  public func fetch(imageName: String) async throws -> UIImage? {
    if let url = URL(string: imageName) {
      let urlRequest = URLRequest(url: url)

      let (data, _) = try await URLSession.shared.data(for: urlRequest, delegate: nil)

       return UIImage(data: data)
    }

    return nil
  }
}
