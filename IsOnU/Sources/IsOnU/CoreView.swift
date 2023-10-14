import SwiftUI

struct CoreView: View {
    @State private var url: URL?

    public init() {}

    var body: some View {
        VStack {
            Text("Hello, World!")
            if let url {
                Text("From \(url.absoluteString)")
            }
        }
        .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
            guard let url = userActivity.webpageURL else {
                return
            }
            self.url = url
        }
        .onOpenURL { url in
            self.url = url
        }
    }
}

#Preview {
    CoreView()
}
