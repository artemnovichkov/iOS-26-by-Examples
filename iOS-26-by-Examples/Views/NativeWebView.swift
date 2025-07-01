//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI
import WebKit

struct NativeWebView: View {
    @State private var webPage = WebPage()

    var body: some View {
        WebView(webPage)
            .onAppear {
                webPage.load(URLRequest(url: .init(string: "https://www.artemnovichkov.com")!))
            }
            .navigationTitle("Web View")
    }
}

#Preview {
    NativeWebView()
}
