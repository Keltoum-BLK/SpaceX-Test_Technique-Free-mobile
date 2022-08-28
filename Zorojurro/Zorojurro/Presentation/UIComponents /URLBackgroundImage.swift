//
//  URLBackgroundImage.swift
//  Zorojurro
//
//  Created by Kel_Jellysh on 28/08/2022.
//

import SwiftUI

struct URLBackgroungImage: View {
    let urlString: String
    @StateObject var apiService = ApiService()
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiImage = UIImage(data: data) {
            ZStack{
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            }
        } else {
            ZStack {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                        .onAppear {
                            fetchData()
                    }
            }
            
        }
    }
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
    }
        dataTask.resume()
    }
}

