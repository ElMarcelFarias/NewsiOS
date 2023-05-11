//
//  SystemExtensions.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 10/05/23.
//

import UIKit

extension DateFormatter {
    
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
}



extension Date {
    
    func toString(with formatter: String = "dd/MM/yyyy") -> String? {
        let dateFormat = DateFormatter()
        
        if Calendar.current.isDateInToday(self) {
            dateFormat.dateFormat = "HH:mm"
            dateFormat.locale = Locale.init(identifier: "pt-br")
            dateFormat.timeZone = TimeZone(abbreviation: "UTC")
            return "Hoje às \(dateFormat.string(from: self))"
        }
        
        dateFormat.dateFormat = formatter
        return dateFormat.string(from: self)
    }
    
}


extension UIImageView {
    
    func downloadedImage(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        //fazendo requisição para a busca da imagem, http
        
        
        contentMode = mode
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mineType = response?.mimeType, mineType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                DispatchQueue.main.async { [weak self] in
                    self?.image = UIImage(named: "no-image.png")
                }
                return
            }
            
            
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
        
    }
    
    func loadImage(from link: String?, contentMode mode: ContentMode = .scaleAspectFit) {
        
        //print("link: \(link)  mode: \(mode)")
        guard let link = link else {
            return
        }
        
        if let url = URL(string: link) {
            print("URL: \(url)")
            downloadedImage(from: url, contentMode: mode)
        }
        
        

    }
    
}
