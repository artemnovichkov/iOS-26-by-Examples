//
//  Created by Artem Novichkov on 01.07.2025.
//

import SwiftUI

struct NewTabView: View {
    @State private var searchText: String = ""

    var body: some View {
        TabView {
            Tab("Summary", systemImage: "heart") {
                NavigationStack {
                    List {
                        ForEach(0..<100) { index in
                            Text("Row \(index + 1)")
                        }
                    }
                    .navigationTitle("Summary")
                }
            }
            
            Tab("Sharing", systemImage: "person.2.fill") {
                NavigationStack {
                    Text("Sharing")
                        .navigationTitle("Sharing")
                }
            }
            
            Tab("Search", systemImage: "magnifyingglass", role: .search) {
                NavigationStack {
                    List {
                        ForEach(0..<100) { index in
                            Text("Row \(index + 1)")
                        }
                    }
                    .navigationTitle("Search")
                    .searchable(text: $searchText)
                }
            }
        }
        .tabViewBottomAccessory {
            Text("Bottom Accessory")
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    NewTabView()
}
