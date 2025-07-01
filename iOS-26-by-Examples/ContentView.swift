//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

enum Destination: String, CaseIterable {
    case nativeWebView = "Native web view"
    case richTextEditor = "Rich text editor"
    case chart3D = "Chart3D"
    case sfSymbols = "SF Symbols"
    case listIndexLabel = "List Index Label"
    case animatable = "Animatable"
    case backgroundExtensionEffect = "Background Extension Effect View"
    case labelSpacing = "Label Spacing"
    case tabView = "Tab View"
    case GlassEffectContainer = "Glass Effect Container"
}

struct ContentView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("iOS 26")
                .navigationSubtitle("by Examples")
                .searchable(text: $searchText, prompt: "Search")
        }
    }

    // MARK: - Private

    @ViewBuilder
    private var content: some View {
        if destinations.isEmpty {
            ContentUnavailableView("No examples", systemImage: "xmark")
        } else {
            List(destinations, id: \.self) { destination in
                NavigationLink(destination.rawValue, value: destination)
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .nativeWebView:
                    NativeWebView()
                case .richTextEditor:
                    RichTextEditor()
                case .chart3D:
                    Chart3DView()
                case .sfSymbols:
                    SFSymbolsView()
                case .listIndexLabel:
                    ListSectionIndexLabel()
                case .animatable:
                    AnimatableView()
                case .backgroundExtensionEffect:
                    BackgroundExtensionEffectView()
                case .labelSpacing:
                    LabelSpacingView()
                case .tabView:
                    NewTabView()
                case .GlassEffectContainer:
                    GlassEffectContainerView()
                }
            }
        }
    }

    private var destinations: [Destination] {
        if searchText.isEmpty {
            return Destination.allCases
        }
        return Destination.allCases
            .filter { destination in
                destination.rawValue.localizedCaseInsensitiveContains(searchText)
            }
    }
}

#Preview {
    ContentView()
}
