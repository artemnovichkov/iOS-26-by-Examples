//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct ToolbarSpacerView: View {
    var body: some View {
        Color(.systemGray5)
            .ignoresSafeArea()
            .navigationTitle("ToolbarSpacer")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button("", systemImage: "heart.fill") { }
                        Button("", systemImage: "square.and.arrow.up") { }
                    }
                }
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "gear") { }
                }
            }
    }
}

#Preview {
    ToolbarSpacerView()
}
