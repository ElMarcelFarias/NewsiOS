//
//  NewsModel.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 08/05/23.
//

import Foundation

struct NewsModel: Codable {
    var source: SourceModel
    var author: String?
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: Date
    var content: String?
}
