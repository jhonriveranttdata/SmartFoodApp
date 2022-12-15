//
//  FoodResponse.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//
import Foundation

struct FoodResponse: Decodable{
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
}
