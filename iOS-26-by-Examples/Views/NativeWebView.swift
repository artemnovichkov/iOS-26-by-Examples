//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI
import WebKit

struct NativeWebView: View {
    @State private var webPage = WebPage()

    var body: some View {
        WebView(webPage)
            .ignoresSafeArea(.container, edges: .bottom)
            .webViewContentBackground(.visible)
            .safeAreaInset(edge: .top) {
                if webPage.isLoading {
                    ProgressView("Loading...", value: webPage.estimatedProgress)
                        .progressViewStyle(.linear)
                        .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ToolbarBackForwardMenuView(
                        list: webPage.backForwardList.backList.reversed(),
                        label: .init(text: "Backward", systemImage: "chevron.backward")
                    ) { item in
                        webPage.load(item)
                    }
                    ToolbarBackForwardMenuView(
                        list: webPage.backForwardList.forwardList,
                        label: .init(text: "Forward", systemImage: "chevron.forward")
                    ) { item in
                        webPage.load(item)
                    }
                    Spacer()
                    Button(action: {
                        webPage.reload()
                    }) {
                        Label("Reload", systemImage: "arrow.clockwise")
                    }
                    if let url = webPage.url {
                        ShareLink(item: url)
                    }
                }
            }
            .toolbarRole(.browser)
            .toolbarBackground(.white, for: .navigationBar)
            .onAppear {
                let url = URL(string: "https://www.artemnovichkov.com")!
                webPage.load(URLRequest(url: url))
            }
            .onDisappear {
                webPage.stopLoading()
            }
            .navigationTitle(webPage.title)
    }

    @MainActor
    private func checkDescription() async {
        do {
            let fetchOpenGraphProperty = """
            return document.querySelector(`meta[property="${property}"]`)?.content;
            """
            let arguments = [
                "property": "og:description"
            ]

            let description = try await webPage.callJavaScript(fetchOpenGraphProperty, arguments: arguments) as? String
            print(description ?? "No description found")
        } catch {
            print("Error callJavaScript: \(error)")
        }
    }
}

private struct ToolbarBackForwardMenuView: View {
    struct LabelConfiguration {
        let text: String
        let systemImage: String
    }

    let list: [WebPage.BackForwardList.Item]
    let label: LabelConfiguration
    let navigateToItem: (WebPage.BackForwardList.Item) -> Void

    var body: some View {
        Menu {
            ForEach(list) { item in
                Button(item.title ?? item.url.absoluteString) {
                    navigateToItem(item)
                }
            }
        } label: {
            Label(label.text, systemImage: label.systemImage)
                .labelStyle(.iconOnly)
        } primaryAction: {
            navigateToItem(list.first!)
        }
        .menuIndicator(.hidden)
        .disabled(list.isEmpty)
    }
}

#Preview {
    NavigationStack {
        NativeWebView()
    }
}
