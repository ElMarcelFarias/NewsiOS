//
//  NewsTableViewCell.swift
//  NewsiOS
//
//  Created by Marcel Leite de Farias on 11/05/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var publishLabel: UILabel!
    @IBOutlet weak var linkImageView: UIImageView!

    
    //para popular as nossas noticias, colocar informações do JSON
    public var news: NewsModel? {
        didSet {
            self.sourceNameLabel.text  = news?.source.name
            self.authorLabel.text = news?.author
            self.titleLabel.text = news?.title
            self.descriptionLabel.text = news?.description
            self.imageImageView.loadImage(from: news?.urlToImage)
            self.publishLabel.text = "teste"
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(openLink))
        self.linkImageView.isUserInteractionEnabled = true
        self.linkImageView.addGestureRecognizer(tap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func openLink () {
        guard let news = news, let url = URL(string: news.url!) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
