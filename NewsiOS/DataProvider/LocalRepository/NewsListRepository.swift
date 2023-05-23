//
//  NewsListRepository.swift
//  AppDIONews
//

import Foundation

enum NewsListError: Error {
    case fileNotFound
}

class NewsListRepository {
    
    static var shared: NewsListRepository = {
        let instance = NewsListRepository()
        return instance
    }()
    
    private init() { }
    
    
    
    func getNewsList(completion: @escaping (ResponseModel?, Error?) -> Void) {
        let errorData = NSError(domain:"", code: 901 , userInfo: [NSLocalizedDescriptionKey: "Error codding"]) as Error
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&apiKey=fb9743b9387043a6a905aee88dc523a1") else { return }
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                return completion(nil, error)
            }
            
            guard let response = response as? HTTPURLResponse  else { return }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    return completion(nil, errorData)
                }

                do {
                    let object = try JSONDecoder().decode(ResponseModel.self, from: data)
                    completion(object, nil)
                } catch {
                    completion(nil, error)
                }
            }

            
        }
        task.resume()
        
       
    }
    
}
