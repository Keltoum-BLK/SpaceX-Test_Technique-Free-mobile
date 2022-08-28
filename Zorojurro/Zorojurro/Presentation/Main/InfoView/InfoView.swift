//
//  InfoView.swift
//  Zorojurro
//
//  Created by Kel_Jellysh on 28/08/2022.
//

import SwiftUI

struct InfoView: View {
    let mission: Mission
    var body: some View {
        HStack {
            VStack {
                URLImage(urlString: mission.links.patch.small ?? "")
            }
            Spacer()
            VStack{
                Text(mission.name)
                    .bold()
                    .font(.system(size: 20))
                    .lineLimit(2)
                Text(convertDate(_: mission.date_utc))
                    .font(.body)
                    .italic()
            }
            .foregroundColor(.black)
            
            Spacer()
            
            VStack {
                Text("\((mission.success ?? true) ? "Success" : "Failure")")
                    .foregroundColor((mission.success ?? true) ? Color.green : Color.red)
                    .bold()
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 10)
            }
        }
        .padding(.all)
        .background(.gray)
        .listStyle(.insetGrouped)
        .overlay(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).stroke(Color.white, lineWidth: 10))
    }
}


func convertDate(_ date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let date = dateFormatter.date(from: date)
    
    dateFormatter.dateFormat = "MMM dd, yyyy h:mm a"
    return dateFormatter.string(from: date ?? Date.now)
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        let mission = Mission(name: "", date_utc: "", success: false, details: "", rocket: "", links: Links(patch: Patch(small: "", large: "")))
        InfoView(mission: mission)
    }
}
