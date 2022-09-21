//
//  ProfessorModel.swift
//  ProfessoresCRUD
//
//  Created by user226741 on 9/21/22.
//

import Foundation

//Já abrange o decodable o codable
struct ProfessorModel : Codable {
    var id : Int
    var nome : String
    var email : String
    
}
