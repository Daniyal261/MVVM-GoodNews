//
//  ArticleModel.swift
//  MVVM-GoodWeather
//
//  Created by Raja Adeel Ahmed on 3/24/23.
//

import Foundation

class ArticleList:Codable{
    var articles:[Article]
    var totalResults:Int
    var status:String
}

class Article :Codable {
    var title:String? = ""
    var description:String? = ""
}
