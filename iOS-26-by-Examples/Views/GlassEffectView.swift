//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct GlassEffectView: View {
    @State private var position = CGPoint(x: 100, y: 100)
    @State private var isInteractive = true

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.monblanc)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .containerRelativeFrame(.horizontal)
                .ignoresSafeArea(.container, edges: [.top, .bottom])
            Text("Drag me")
                .font(.largeTitle)
                .padding()
                .glassEffect(.regular.interactive(isInteractive), in: .capsule)
                .position(position)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            position = value.location
                        }
                )
        }
        .safeAreaInset(edge: .bottom) {
            Toggle("Interactive", isOn: $isInteractive)
                .padding()
                .glassEffect(.regular)
                .padding()
        }
    }
}

#Preview {
    GlassEffectView()
}
