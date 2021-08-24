//
//  Model.swift
//  News
//
//  Created by Роман on 22.08.2021.
//

import Foundation

var news: [ModelNews] {
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return []
    }
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil{
        return []
    }
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return []
    }
    if let array = rootDictionary?["news"] as? [Dictionary<String, Any>]{
        var returnArray: [ModelNews] = []
            for dict in array {
                let newNews = ModelNews(dictionary: dict)
                returnArray.append(newNews)
            }
            return returnArray
    }
    return []
}
var urlToData: URL{
    let pathForDirectories = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: pathForDirectories)
    return urlPath
}


func loadNews(completionHandler:(() -> Void)?) {
    
    let urlByNews = "https://newsapi.org/v2/everything?q=apple&from=2021-08-21&to=2021-08-21&sortBy=popularity&apiKey=\(apiKey)"
    guard let url = URL(string: urlByNews) else {return}
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url) { urlItem, responce, error in
        
        if urlItem != nil{
            do {
                try? FileManager.default.removeItem(at: urlToData)
                try FileManager.default.copyItem(at: urlItem!, to: urlToData)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        completionHandler?()
    }
    
    downloadTask.resume()
    
}

