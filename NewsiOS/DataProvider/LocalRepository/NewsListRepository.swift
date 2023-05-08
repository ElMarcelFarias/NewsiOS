//
//  NewListRepository.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 08/05/23.
//

import Foundation

enum NewsListError: Error {
    case fileNotFound
}

class NewListRepository {
    
    static var shared: NewListRepository = {
        let instance = NewListRepository()
        return instance
    }()
    
    private init() {}
    
    func getNewsList(completion: ([NewsModel]?, Error?) -> Void) -> Void {
        if let path = Bundle.main.path(forResource: "NewsList", ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                
                let decoder = JSONDecoder()
                let newsModelList = try decoder.decode([NewsModel].self, from: data)
                
                completion(newsModelList, nil)
            } catch {
                completion(nil, error)
            }
        } else {
            completion(nil, NewsListError.fileNotFound)
        }
    }
    
}
