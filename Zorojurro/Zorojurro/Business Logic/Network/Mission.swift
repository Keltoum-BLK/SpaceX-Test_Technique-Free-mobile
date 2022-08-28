//
//  SpaceData.swift
//  Zorojurro
//
//  Created by Kel_Jellysh on 28/08/2022.
//
import Foundation


import Foundation

struct Mission: Decodable, Hashable {
    
    let name: String
    let date_utc: String
    let success: Bool?
    let details: String?
    let rocket: String
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case name, date_utc,details, rocket
        case success
        case links
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        return lhs.name == rhs.name && lhs.date_utc == rhs.date_utc && lhs.success == rhs.success && lhs.details == rhs.details && lhs.rocket == rhs.rocket && lhs.links == rhs.links
    }
}

struct Links: Decodable, Equatable {
    
    var patch: Patch
    
    init(patch: Patch) {
        self.patch = patch
    }
    static func == (lhs: Links, rhs: Links) -> Bool {
        return lhs.patch == rhs.patch
    }
    
    enum CodingKeys: String, CodingKey {
        case patch
    }
}

struct Patch: Decodable, Equatable {
    let small: String?
    let large: String?
    
    enum CodingKeys: String, CodingKey {
        case small, large
        
    }
}

