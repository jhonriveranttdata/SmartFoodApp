//
//  Networking.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import Foundation

class FoodMocksAPI : HomeRemoteRepositoryProtocol{
    
    func FetchFoods() -> [FoodResponse]{
        let resources = "FoodResponse"
        if let url = Bundle.main.url(forResource: resources, withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let result = try decoder.decode([FoodResponse].self, from: data)
                return result
            }catch let error {
                print(error.localizedDescription)
            }
        }
        return []
    }
    
    func FetchCategoryFoods() -> [CategoryFoods]{
        let resources = "CategoryFoods"
        if let url = Bundle.main.url(forResource: resources, withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let result = try decoder.decode([CategoryFoods].self, from: data)
                return result
            }catch let error {
                print(error.localizedDescription)
            }
        }
        return []
    }
    
    func FetchUser() -> [UserResponse]{
        let resources = "User"
        if let url = Bundle.main.url(forResource: resources, withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let result = try decoder.decode([UserResponse].self, from: data)
                return result
            }catch let error {
                print(error.localizedDescription)
            }
        }
        return []
    }
}
