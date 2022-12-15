//
//  FoodDetail.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
class FoodDetail :ItemDetailFoodProtocol{
    var id: Int
    var nombre: String
    var categoria: String
    var dato: String
    var ingredientes: String
    var recomendacion: Bool
    var preparacion: String
    var favorite: Bool
    var puntuacion: Double
    var imgName: String
    var historia: String
    
    required init(id: Int,nombre: String,categoria: String,dato: String,ingredientes: String,recomendacion: Bool, preparacion: String, favorite: Bool, puntuacion: Double, imgName: String, historia: String) {
        self.id = id
        self.nombre = nombre
        self.categoria = categoria
        self.dato = dato
        self.ingredientes = ingredientes
        self.recomendacion = recomendacion
        self.preparacion = preparacion
        self.favorite = favorite
        self.puntuacion = puntuacion
        self.imgName = imgName
        self.historia = historia
    }
     
 
}


