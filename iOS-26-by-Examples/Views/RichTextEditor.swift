//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct RichTextEditor: View {
    @Environment(\.fontResolutionContext) private var fontResolutionContext
    @State private var text: AttributedString = ""
    @State private var selection = AttributedTextSelection()
    @FocusState private var isFocused: Bool

    var body: some View {
        TextEditor(text: $text, selection: $selection)
            .focused($isFocused)
            .padding(.horizontal)
            .onAppear {
                var text = AttributedString(
                    "Hello 👋🏻! Who's ready to get "
                )

                var cooking = AttributedString("cooking")
                cooking.foregroundColor = .orange
                text += cooking

                text += AttributedString("?")

                text.font = .largeTitle
                self.text = text
                isFocused = true
            }
            .navigationTitle("Rich text editor")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Button("Bold", systemImage: "bold") {
                            text.transformAttributes(in: &selection) { container in
                                let currentFont = container.font ?? .default
                                let resolved = currentFont.resolve(in: fontResolutionContext)
                                container.font = currentFont.bold(!resolved.isBold)
                            }
                        }
                        .frame(width: 32, height: 32)

                        Button("Italic", systemImage: "italic") {
                            text.transformAttributes(in: &selection) { container in
                                let currentFont = container.font ?? .default
                                let resolved = currentFont.resolve(in: fontResolutionContext)
                                container.font = currentFont.italic(!resolved.isItalic)
                            }
                        }
                        .frame(width: 32, height: 32)

                        Spacer()
                    }
                }
            }
    }
}

#Preview {
    RichTextEditor()
}
