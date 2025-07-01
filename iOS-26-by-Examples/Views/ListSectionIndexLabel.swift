//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct ListSectionIndexLabel: View {
    private let labels = ["A", "B", "C", "D"]

    var body: some View {
        List(labels, id: \.self) { letter in
            Section(letter) {
                ForEach(0..<6) { number in
                    Text("Row \(number + 1)")
                }
            }
            .sectionIndexLabel(letter)
        }
        .listSectionIndexVisibility(.visible)
        .navigationTitle("List Section Index Label")
    }
}

#Preview {
    ListSectionIndexLabel()
}
