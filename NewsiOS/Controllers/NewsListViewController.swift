//
//  NewsListViewController.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 08/05/23.
//

import UIKit

class NewsListViewController: UIViewController {
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNewsViewController", let destination = segue.destination as? NewsViewController {
            destination.news = sender as? NewsModel
        }
    }
    private func setupTableView() {
        self.newsListTableView.delegate = self
        self.newsListTableView.dataSource = self
        self.newsListTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewsList()
    }
    
    

}


extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("didSelectRowAt ==> \(indexPath)")
        //você selecionou essa linha
        
        guard let newsList = newsList else { fatalError("The selected news was not found!") }
        
        performSegue(withIdentifier: "ShowNewsViewController", sender: newsList[indexPath.row])
    }
}

extension NewsListViewController: NewsListLocalDataProviderDelegate {
    func success(model: Any) {
        self.newsList = model as? [NewsModel]
    }
    
    func errorData(_ provider: GenericDataProvider?, error: Error?) {
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numero de linhas dentro de uma seção, quantidade de elementos dentro do array
        return self.newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            fatalError("Unable to dequeue subclass cell")
        }
        
        guard let newsList = newsList else {
            fatalError("Does not have a news list")
        }
        
        cell.news = newsList[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}
