//
//  WebServices.swift
//  MVVM-GoodWeather
//
//  Created by Raja Adeel Ahmed on 3/24/23.
//

import Foundation
class WebService {
    
    func getArticles(url:URL, completion:@escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data , response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(data)
                let arcticles = try! JSONDecoder().decode(ArticleList.self, from: data)
                completion(arcticles.articles)
            }
        }.resume()
    }
}
