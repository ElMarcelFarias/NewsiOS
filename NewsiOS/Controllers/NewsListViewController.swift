//
//  NewsListViewController.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 08/05/23.
//

import UIKit

class NewsListViewController: UIViewController, NewsListLocalDataProviderDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var newsListTableView: UITableView!
    
    private var newsList: [NewsModel]? {
        didSet {
            self.newsListTableView.reloadData()
        }
    }
    
    var localDataProvider: NewsListLocalDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.initLocalDataProvider()
    }
    private func setupTableView() {
        self.newsListTableView.delegate = self
        self.newsListTableView.dataSource = self
    }
    
    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewsList()
    }
    
    
    
    
    func success(model: Any) {
        self.newsList = model as? [NewsModel]
    }
    
    func errorData(_ provider: GenericDataProvider?, error: Error?) {
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt ==> \(indexPath)")
        //você selecionou essa linha
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numero de linhas dentro de uma seção, quantidade de elementos dentro do array
        return self.newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

