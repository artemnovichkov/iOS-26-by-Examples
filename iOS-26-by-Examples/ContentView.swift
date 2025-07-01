//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

enum Destination: String, CaseIterable, Identifiable {
    case animatable = "Animatable"
    case backgroundExtensionEffect = "Background Extension Effect View"
    case chart3D = "Chart3D"
    case GlassEffectContainer = "Glass Effect Container"
    case labelSpacing = "Label Spacing"
    case listIndexLabel = "List Index Label"
    case nativeWebView = "Native web view"
    case richTextEditor = "Rich text editor"
    case sfSymbols = "SF Symbols"
    case tabView = "Tab View"

    var id: String { self.rawValue }

    var isSheet: Bool {
        self == .tabView
    }
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedSheetDestination: Destination? = nil
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("iOS 26")
                .navigationSubtitle("by Examples")
                .searchable(text: $searchText, prompt: "Search")
        }
        .sheet(item: $selectedSheetDestination) { destination in
            switch destination {
            case .tabView:
                NewTabView()
            default:
                EmptyView()
            }
        }
    }

    // MARK: - Private

    @ViewBuilder
    private var content: some View {
        if destinations.isEmpty {
            ContentUnavailableView("No examples", systemImage: "xmark")
        } else {
            List {
                ForEach(destinations) { destination in
                    if destination.isSheet {
                        Button {
                            selectedSheetDestination = destination
                        } label: {
                            HStack {
                                Text(destination.rawValue)
                                    .foregroundStyle(Color(.label))
                                Spacer()
                                NavigationLink(destination: EmptyView.init, label: EmptyView.init)
                            }
                        }
                    } else {
                        NavigationLink(destination.rawValue, value: destination)
                    }
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .animatable:
                    AnimatableView()
                case .backgroundExtensionEffect:
                    BackgroundExtensionEffectView()
                case .chart3D:
                    Chart3DView()
                case .GlassEffectContainer:
                    GlassEffectContainerView()
                case .labelSpacing:
                    LabelSpacingView()
                case .listIndexLabel:
                    ListSectionIndexLabel()
                case .nativeWebView:
                    NativeWebView()
                case .richTextEditor:
                    RichTextEditor()
                case .sfSymbols:
                    SFSymbolsView()
                case .tabView:
                    NewTabView()
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
