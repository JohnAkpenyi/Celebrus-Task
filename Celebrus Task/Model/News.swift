//
//  News.swift
//  Celebrus Task
//
//  Created by John Akpenyi on 10/01/2023.
//

import Foundation

class News{
    
    private var title = ""
    private var date = Date()
    private var description = ""
    
    init(title: String = "", date: Date = Date(), description: String = "") {
        self.title = title
        self.date = date
        self.description = description
    }
    
    @objc func getTitle() -> String{
        return self.title
    }
    
    @objc func setTitle(title: String){
        self.title = title
    }
    
    @objc func getDate() -> Date{
        return self.date
    }
    
    @objc func setDate(date: Date){
        self.date = date
    }
    
    @objc func getDesc() -> String{
        return self.description
    }
    
    @objc func setDesc(description: String){
        self.description = description
    }
}
