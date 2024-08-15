//
//  NoteModel.swift
//  Proyecto_Integrador_DAGG
//
//  Created by Daniel Alejandro Garduño Galicia on 04/08/24.
//

import Foundation

struct NoteModel: Codable {
    let id: String
    var isFavorited: Bool
    let description: String
    
    init(id: String = UUID().uuidString, isFavorited: Bool = false, description: String) {
        self.id = id
        self.isFavorited = isFavorited
        self.description = description
    }
}
