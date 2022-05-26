//
//  News.swift
//  NewsApp
//
//  Created by abdalla mahmoud on 26/05/2022.
//

import Foundation

struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Articles]
}

struct Articles: Codable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}
