//
//  DAO.swift
//  Celebrus Task
//
//  Created by John Akpenyi on 10/01/2023.
//

import Foundation

class Dao{
    
    private let API_KEY = "1d5fc132cf2045ec8c6226cefcc76a49"
        
    /**Envokes Get Request to news api*/
    func getRequest(keyword: String, completionHandler: @escaping ([Article])->Void ){
        
        // use if let rather than force unwrapping
        if let url = URL(string: "https://newsapi.org/v2/everything?q=\(keyword)&searchIn=description&apiKey=\(API_KEY)"){
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                
                if let data = data {
                    
                    do{
                        let result = try JSONDecoder().decode(Articles.self, from: data)
                        completionHandler(result.articles)
                    }catch let error{
                        print(error.localizedDescription)
                    }
                    
                    
                 } else if let error = error {
                     print("HTTP Request Failed \(error)")
                 }
            }
            
            task.resume()
        }
        
    }
    
}
