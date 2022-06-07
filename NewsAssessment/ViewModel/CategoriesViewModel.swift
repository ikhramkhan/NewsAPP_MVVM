//
//  CategoriesViewModel.swift
//  NewsAssessment
//
//  Created by Mohamed Ikhram Khan on 06/06/2022.
//

import Foundation

class CategoriesViewModel{
   
    var dataArray: Box<[CategoriesResponse]> = Box([])
    
// Getting data from JSON file for Countries and Categories list
    func getListOfCategoryAndCoutries()  {
        let jsonData = readLocalJSONFile(forName: "Categories")
        if let data = jsonData {
            if let sampleRecordObj = parse(jsonData: data) {
                dataArray.value = [sampleRecordObj]
            }
        }
      
    }
}



