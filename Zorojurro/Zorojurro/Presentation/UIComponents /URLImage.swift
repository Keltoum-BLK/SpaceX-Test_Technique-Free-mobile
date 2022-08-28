//
//  URLImage.swift
//  Zorojurro
//
//  Created by Kel_Jellysh on 28/08/2022.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    @StateObject var apiService = ApiService()
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.all, 5)
                .aspectRatio(contentMode: .fill)
                .overlay(Circle().stroke(Color.black, lineWidth: 3))
        } else {
            Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.all, 5)
                    .aspectRatio(contentMode: .fill)
                    .overlay(Circle().stroke(Color.black, lineWidth: 3))
                    .onAppear {
                        fetchData()
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
