//
//  Task.swift
//  Tasks
//
//  Created by Enrique Poyato Ortiz on 11/5/23.
//

import Foundation

struct Task: Codable{
    let id: String
    var favorite: Bool
    let description: String
    
    init(id: String = UUID().uuidString, favorite: Bool = false, description: String) {
        self.id = id
        self.favorite = favorite
        self.description = description
    }
}
