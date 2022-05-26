//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by abdalla mahmoud on 26/05/2022.
//

import Foundation

struct NewsViewModel {
    let news: Articles
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "Unknown URL"
    }
}
