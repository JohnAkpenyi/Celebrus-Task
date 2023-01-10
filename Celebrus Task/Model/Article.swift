//
//  News.swift
//  Celebrus Task
//
//  Created by John Akpenyi on 10/01/2023.
//

import Foundation

struct Article: Codable{
    
    private var title : String
    private var publishedAt: String
    private var url : String
    private var description : String?

    
    init(title: String = "", publishedAt: String, url: String, description: String = "") {
        self.title = title
        self.publishedAt = publishedAt
        self.url = url
        self.description = description
    }
    
    func getTitle() -> String{
        return self.title
    }
    
    mutating func setTitle(title: String){
        self.title = title
    }
    
    func getPublishedAt() -> String{
        return self.publishedAt
    }
    
    mutating func setPublishedAt(publishedAt: String){
        self.publishedAt = publishedAt
    }
    
    func getUrl() -> String{
        return self.url
    }
    
    mutating func setUrl(url: String){
        self.url = url
    }
    
    func getDesc() -> String{
        return self.description ?? ""
    }
    
    mutating func setDesc(description: String){
        self.description = description
    }
}

struct Articles: Codable {
    var articles:[Article]
}
