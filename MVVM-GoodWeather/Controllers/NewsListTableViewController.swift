//
//  NewsListTableViewController.swift
//  MVVM-GoodWeather
//
//  Created by Raja Adeel Ahmed on 3/22/23.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articlesListVM:ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    fileprivate func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=<URL API KEY>")!
        WebService().getArticles(url: url) { articlesArray in
            guard let articels = articlesArray else {
                print("No articles founds")
                return
            }
            self.articlesListVM = ArticleListViewModel(articles: articels)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articlesListVM == nil ? 0 : self.articlesListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesListVM == nil ? 1 : self.articlesListVM.numberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticelTableViewCell", for: indexPath) as? ArticelTableViewCell else {
            fatalError("ArticleTableViewCell Not found")
        }
        let articleVM = self.articlesListVM.articleAtIndex(index: indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
                
    }
}
