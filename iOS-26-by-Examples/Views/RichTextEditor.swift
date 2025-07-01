//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct RichTextEditor: View {
    @State private var text: AttributedString = ""

    var body: some View {
        TextEditor(text: $text)
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
            }
            .navigationTitle("Rich text editor")
    }
}

#Preview {
    RichTextEditor()
}
