//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct LabelSpacingView: View {
    var body: some View {
        VStack {
            Label("New App", systemImage: "app.grid")
            Button("New App", systemImage: "app.grid") {}
        }
        .font(.largeTitle)
        .labelIconToTitleSpacing(48)
        .labelReservedIconWidth(48)
        .navigationTitle("Label Spacing")
    }
}

#Preview {
    LabelSpacingView()
}
