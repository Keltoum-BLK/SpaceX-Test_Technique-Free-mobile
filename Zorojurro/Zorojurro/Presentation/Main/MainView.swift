//
//  ContentView.swift
//  Zorojurro
//
//  Created by Kel_Jellysh on 28/08/2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = ApiService()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.missions, id: \.self) { mission in
                        NavigationLink(destination: MissionDetailsView(mission: mission)) {
                        InfoView(mission: mission)
                        }
                    }
                }
            }
            .padding(.horizontal, 10.0)
            .listStyle(.insetGrouped)
            .onAppear {
                viewModel.fetchMissions()
            }
            .navigationTitle("SpaceX Missions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewLayout(.sizeThatFits)
    }
}
