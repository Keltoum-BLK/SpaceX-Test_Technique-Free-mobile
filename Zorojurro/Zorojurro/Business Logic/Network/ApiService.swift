//
//  ApiService.swift
//  Zorojurro
//
//  Created by Kel_Jellysh on 28/08/2022.
//
import Foundation
import SwiftUI

class ApiService: ObservableObject {
   @Published var missions = [Mission]()
    
    //MARK: Properties
    private var dataTask: URLSessionDataTask?
    var session = URLSession(configuration: .default)
   
    //MARK: Methods
 
    func fetchMissions() {
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches") else {
            fatalError("Missing URL") }
      
        dataTask = session.dataTask(with: url) { [weak self] (data, response, error) in
         
            guard let data = data, error == nil else {
                return
            }
            do {
                let missionSpace = try JSONDecoder().decode([Mission].self, from: data)
                DispatchQueue.main.async {
                    self?.missions = missionSpace
                    print(self?.missions)
                }
            } catch {
                print("\(error.localizedDescription)")
            }
        }
        dataTask?.resume()
    }
}
