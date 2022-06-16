//
//  MainViewModel.swift
//  NewsApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import Foundation


final class MainViewModel {
    
    var mainVCDelegate:MainVCProtocol?
    var news : [Article] = []
    let webService :WebService
    init() {
        webService = WebService()
    }
    
    func fetchNews() {
        
        
        
        webService.getData(url: Route.url.asUrl!) { [weak self] (articles) in
            
            print(articles)
            self?.news = articles ?? []
            self?.mainVCDelegate!.saveData(datas: self?.news ?? [])
            
        }
    }
}
