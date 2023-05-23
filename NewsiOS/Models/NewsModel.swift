//
//  NewsModel.swift
//  AppDIONews
//

import Foundation


struct ResponseModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [NewsModel]?
}

struct NewsModel: Codable {
    var source: SourceModel
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
