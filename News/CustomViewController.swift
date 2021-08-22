//
//  CustomViewController.swift
//  News
//
//  Created by Роман on 22.08.2021.
//

import UIKit

class CustomViewController: UIViewController {
    
    var news: ModelNews!
    let refreshControl = UIRefreshControl()

 
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var newsText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20
        newsText.lineBreakMode = .byWordWrapping
        titleLable.text = news.title
        newsText.text = news.description
        downloadImage()
    }
    

    func downloadImage() {
        DispatchQueue.main.async {
            if let urlImage = URL(string: self.news.urlToImage){
                if let data = try? Data(contentsOf: urlImage){
                    self.imageView.image = UIImage(data:data)
                }
            }
            else {
                self.imageView.image = UIImage(systemName: "No.jpg")
            }
        }
        
        
    }
    
}
