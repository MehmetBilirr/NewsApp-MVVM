//
//  DetailsVCViewController.swift
//  NewsApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import UIKit
import SnapKit
import AlamofireImage

protocol DetailsVCProtocol {
    
    func setup(news:Article)
    
    
}

final class DetailsVCViewController: UIViewController {
    static let identifier = "DetailsVCViewController"
    private let newsImage = UIImageView()
    private let titleLbl = UILabel()
    private let detailLabel = UILabel()
    var viewControl = MainVC()
    var news : Article?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControl.detailsVCDelegate = self
        
        configure()
        
    }
    
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.view.backgroundColor = .systemBackground
            self.titleLbl.font = .boldSystemFont(ofSize: 18)
            self.titleLbl.textColor = .red
            self.detailLabel.textColor = .systemGray
            
            
        }
    }
    
    private func configure() {
        view.addSubview(newsImage)
        view.addSubview(titleLbl)
        view.addSubview(detailLabel)
        detailLabel.numberOfLines = 0
        detailLabel.lineBreakMode = .byWordWrapping
        titleLbl.lineBreakMode = .byWordWrapping
        titleLbl.numberOfLines = 0
        makeImage()
        makeTitle()
        makeDetail()
        drawDesign()
        

        
        
    }
    

}
extension DetailsVCViewController:DetailsVCProtocol {
    
    
    func setup(news: Article) {
        print(news.title)
        newsImage.af.setImage(withURL: news.urlToImage.asUrl!)
        titleLbl.text = news.title
        detailLabel.text = news.description
    }
    
    
    
}

extension DetailsVCViewController {
    
    
    private func makeImage() {
        
        newsImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(400)
        }
    }
    
    private func makeTitle() {
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.bottom).offset(20)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            
        }
        
    }
    
    private func makeDetail() {
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(20)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            
            
            
            
        }
    }




}
