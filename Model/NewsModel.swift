//
//  NewsModel.swift
//  NewsApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    
    var author: String?
    var title: String
    var description: String?
    var urlToImage: String
}
