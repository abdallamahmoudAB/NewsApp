//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by abdalla mahmoud on 26/05/2022.
//

import Foundation

class NewsListViewModel {
    var newsVM = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(completion: @escaping([NewsViewModel]) -> Void) {
        NetworkManager.shared.getNews { news in
            guard let news = news else {
                return
            }
            let newsVM = news.articles.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}
