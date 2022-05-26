//
//  NetworkManager.swift
//  NewsApp
//
//  Created by abdalla mahmoud on 26/05/2022.
//

import Foundation

class NetworkManager {
    
    let imageCache = NSCache<NSString, NSData>()
    static let shared = NetworkManager()
    private init() {}
    
    private let baseUrlString = "https://newsapi.org/v2/"
    private let topHeadline = "top-headlines?sources=techcrunch"
    
    func getNews(completion: @escaping(News?) -> Void) {
        
         let urlString = "\(baseUrlString)\(topHeadline)&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                let jsonData = try JSONDecoder().decode(News.self, from: data)
                    completion(jsonData)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getImage(urlString: String, completion: @escaping(Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cahedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cahedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
