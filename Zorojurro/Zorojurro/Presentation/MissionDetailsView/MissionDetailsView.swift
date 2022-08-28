//
//  MissionDetailsView.swift
//  Zorojurro
//
//  Created by Kel_Jellysh on 28/08/2022.
//

import SwiftUI

struct MissionDetailsView: View {
    let mission: Mission
    var body: some View {
            List {
                Section {
                    URLBackgroungImage(urlString: mission.links.patch.large ?? "")
                } header: {
                    Text(mission.name)
                }
             
                Section {
                    Text(convertDate(mission.date_utc))
                    Text("\((mission.success ?? true) ? "Success" : "Failure")")
                        .foregroundColor((mission.success ?? true) ? Color.green : Color.red)
                        .bold()
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 10)
                } header: {
                    Text("Launch")
                }
             
                Section {
                    Text(mission.details ?? "")
                        .bold()
                        .font(.system(size: 20))
                } header: {
                    Text("Details of the launch")
                }
        }
        .navigationTitle("Launch")
    }
}
struct MissionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let mission = Mission(name: "", date_utc: "", success: false, details: "", rocket: "", links: Links(patch: Patch(small: "", large: "")))
        MissionDetailsView(mission: mission)
    }
}
