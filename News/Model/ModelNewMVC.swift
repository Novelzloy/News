//
//  ModelNewMVC.swift
//  News
//
//  Created by Роман on 22.08.2021.
//

import Foundation

struct ModelNews {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    init(dictionary: Dictionary<String, Any>) {
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["" : ""]) ["name"] as? String ?? ""
    }
}
