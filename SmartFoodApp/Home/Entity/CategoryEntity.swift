//
//  CategoryEntity.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import Foundation

struct CategoryEntity{
    let id : Int
    let nombre :  String
    let imgName: String
    
    static func make(_ category: [CategoryFoods]) -> [CategoryEntity]{
        return category.map({
            CategoryEntity(id: $0.id, nombre: $0.nombre, imgName: $0.imgName)
        })
    }
}
