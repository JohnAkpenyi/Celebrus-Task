//
//  DAO.swift
//  Celebrus Task
//
//  Created by John Akpenyi on 10/01/2023.
//

import Foundation

class Dao{
    
    private let API_KEY = "1d5fc132cf2045ec8c6226cefcc76a49"
    private var keyword = ""
    
    
    /**Envokes Post Request to news api*/
    @objc func getNews(){
        
    }
    
    
    @objc func getKeyword() -> String{
        return self.keyword
    }
    
    @objc func setKeyword(keyword: String){
        self.keyword = keyword
    }
    
}
