//
//  NewsInformationsModel.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 22/05/23.
//


import Foundation

struct ArticleModel: Codable {
    let source: SourceModel
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: Date
    var content: String?
}

struct SourceModel: Codable {
    var id: String?
    var name: String
}

