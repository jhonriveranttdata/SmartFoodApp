//
//  UserEntity.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import Foundation

struct UserEntity {
    let id : Int
    let nombre: String
    let apellido: String
    let usuario: String
    let contrasena: String
    let avatar: String
    
    static func make(_ users: [UserResponse]) -> [UserEntity]{
        return users.map({
            UserEntity(id: $0.id, nombre: $0.nombre, apellido: $0.apellido, usuario: $0.usuario, contrasena: $0.contrasena, avatar: $0.avatar)
        })
    }
}
