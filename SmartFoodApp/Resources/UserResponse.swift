//
//  UserResponse.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import Foundation

struct UserResponse :Decodable{
    let id : Int
    let nombre: String
    let apellido: String
    let usuario: String
    let contrasena: String
    let avatar: String
}
