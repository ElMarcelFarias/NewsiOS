//
//  NewsViewController.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 16/05/23.
//

import WebKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsWebView:WKWebView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView!
    
    
    
    var news: NewsModel? {
        didSet {
            self.title = news?.source.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWebView()

    }
    
    
    private func setupWebView() {
        
        self.newsWebView.navigationDelegate = self
        
        guard let news = news, let url = URL(string: news.url) else {
            return
        }
        
        self.newsWebView.load(URLRequest(url: url))
        self.newsWebView.allowsBackForwardNavigationGestures = true
    }
}


extension NewsViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.loadingActivityIndicator.startAnimating()
        self.loadingView.isHidden = false
        //COMECOU CARREGAR A WEBView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loadingView.isHidden = true
        self.loadingActivityIndicator.stopAnimating()
        //TERMINOU DE CARREGAR A WEBView
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.loadingView.isHidden = false
        self.loadingActivityIndicator.stopAnimating()
        //Se der alguma falha
    }
    
}
