//
//  CategoriesModel.swift
//  NewsAssessment
//
//  Created by Mohamed Ikhram Khan on 06/06/2022.
//

import Foundation

struct CategoriesResponse: Codable {
    var category: [String]?
    var country: [Countries]?
  
}

struct Countries: Codable {
    let   id, name: String?
   
}

func parse(jsonData: Data) -> CategoriesResponse? {
    do {
        let decodedData = try JSONDecoder().decode(CategoriesResponse.self, from: jsonData)
        return decodedData
    } catch {
        print("error: \(error)")
    }
    return nil
}


