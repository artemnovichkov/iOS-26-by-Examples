//
//  Created by Artem Novichkov on 01.07.2025.
//


import SwiftUI

struct AnimatableView: View {
    @State private var startAngle: Angle = .degrees(-90)
    @State private var endAngle: Angle = .degrees(80)

    var body: some View {
        ZStack {
            Arc(startAngle: .degrees(0),
                endAngle: .degrees(360),
                clockwise: false)
            .stroke(Color(.quaternaryLabel), lineWidth: 20)
            Arc(startAngle: startAngle,
                endAngle: endAngle,
                clockwise: false)
            .stroke(.green, style: StrokeStyle(lineWidth: 20, lineCap: .round))
        }
        .padding(32)
        .overlay {
            Button("Animate") {
                withAnimation {
                    endAngle = .degrees(Double(Int.random(in: -90...270)))
                }
            }
            .buttonStyle(.glass)
        }
    }
}

@Animatable
struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    @AnimatableIgnored var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        Path {
            $0.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                      radius: rect.width / 2,
                      startAngle: startAngle,
                      endAngle: endAngle,
                      clockwise: clockwise)
        }
    }
}

#Preview {
    AnimatableView()
}
