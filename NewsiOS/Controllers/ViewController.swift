//
//  ViewController.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 08/05/23.
//

import UIKit

class ViewController: UIViewController, NewsListLocalDataProviderDelegate {
    
    var localDataProvider: NewsListLocalDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLocalDataProvider()
    }
    
    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewsList()
    }
    
    
    func success(model: Any) {
    }
    
    func errorData(_ provider: GenericDataProvider?, error: Error?) {
    }


}

