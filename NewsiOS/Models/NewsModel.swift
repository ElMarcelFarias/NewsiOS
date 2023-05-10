//
//  NewsModel.swift
//  AppDIONews
//
//  Created by Robson Moreira on 27/11/21.
//

import Foundation

struct NewsModel: Codable {
    var source: SourceModel
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: Date
    var content: String?
}
