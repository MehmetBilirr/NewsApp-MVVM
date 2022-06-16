//
//  WebService.swift
//  NewsApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import Foundation



class WebService {
    func getData(url:URL,completion:@escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if  error != nil {
                print(error?.localizedDescription)
                completion(nil)
            }else if let data = data {
                let newsList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                completion(newsList?.articles)
                
            }
        }.resume()
    }
}
