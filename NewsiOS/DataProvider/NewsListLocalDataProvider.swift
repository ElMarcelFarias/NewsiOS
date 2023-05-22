//
//  NewsListLocalDataProvider.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 08/05/23.
//
//  Implementando requisição HTTP a API da newsapi


import Foundation

protocol NewsListLocalDataProviderDelegate: GenericDataProvider { }

class NewsListLocalDataProvider: DataProviderManager<NewsListLocalDataProviderDelegate, NewsModel> {
    
    func getNewsList() {
        NewsListRepository.shared.getNewsList{ newModelList, error in
            if let error = error {
                self.delegate?.errorData(self.delegate, error: error)
                return
            }
            
            if let model = newModelList {
                self.delegate?.success(model: model)
            }
        }
    }
   
}
