//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct SFSymbolsView: View {
    @State private var temperature: Double = 0.5
    @State private var isActive: Bool = true

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .symbolColorRenderingMode(.gradient)
                    .symbolEffect(.drawOn, isActive: !isActive)
                Image(systemName: "thermometer.high", variableValue: temperature)
                    .symbolVariableValueMode(.draw)
                    .symbolEffect(.drawOn, isActive: !isActive)
                Image(systemName: "wind")
                    .symbolEffect(.drawOn, isActive: !isActive)
            }
            .animation(.default, value: temperature)
            .font(.system(size: 100))
            Toggle("Is active", isOn: $isActive)
            Slider(value: $temperature, in: 0...1) {
                Text("Temperature: \(Int(temperature * 100))%")
            } minimumValueLabel: {
                Text("0%")
            } maximumValueLabel: {
                Text("100%")
            }
        }
        .padding()
        .navigationTitle("SF Symbols")
    }
}

#Preview {
    SFSymbolsView()
}
