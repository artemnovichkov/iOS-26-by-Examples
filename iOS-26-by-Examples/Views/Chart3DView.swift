//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI
import Charts

struct Chart3DView: View {
    @State private var pose: Chart3DPose = .front

    var body: some View {
        Chart3D {
            SurfacePlot(x: "X", y: "Y", z: "Z") { x, z in
                sin(x) * cos(z)
            }
            .foregroundStyle(.heightBased)
        }
        .chart3DCameraProjection(.perspective)
        .chart3DPose($pose)
        .navigationTitle("Chart3D")
    }
}

#Preview {
    Chart3DView()
}
