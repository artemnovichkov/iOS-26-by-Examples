//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct BackgroundExtensionEffectView: View {
    var body: some View {
        Image(.monblanc)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .backgroundExtensionEffect()
    }
}

#Preview {
    BackgroundExtensionEffectView()
}
