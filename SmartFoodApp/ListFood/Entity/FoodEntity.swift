//
//  ListFoodEntity.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//
import Foundation

struct FoodEntity {
    let id: Int
    let nombre: String
    let idcategoria: Int
    let categoria: String
    let dato: String
    let ingredientes: String
    let recomendacion: Bool
    let preparacion: String
    let favorite: Bool
    let puntuacion: Double
    let imgName: String
    let historia: String
    
    static func make(_ foods: [FoodResponse]) -> [FoodEntity]{
        return foods.map({
            FoodEntity(id: $0.id, nombre: $0.nombre, idcategoria: $0.idcategoria ,categoria: $0.categoria, dato: $0.dato, ingredientes: $0.ingredientes, recomendacion: $0.recomendacion, preparacion: $0.preparacion, favorite: $0.favorite, puntuacion: $0.puntuacion, imgName: $0.imgName, historia: $0.historia)
        })
    }
}
