//
//  DetailsVCViewController.swift
//  NewsApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import UIKit
import SnapKit

final class DetailsVCViewController: UIViewController {
    static let identifier = "DetailsVCViewController"
    private let newsImage = UIImageView()
    private let titleLbl = UILabel()
    private let detailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsImage.image = UIImage(named: "ataturk")
        titleLbl.text = "kajdlk jl şdkaş skdakj sdhasd adkljaljd asjdn ajsnd ajnd jand"
        detailLabel.text = "kamsdklamsd aksdl kasdjkl ansdkj nakjd nakjsbd ajhdbjkasnd lkansdlk alksdn alkjsdn akjndkaj ndkja nsdkj ansd kajnd akldjaksjd ajd ajd ajdkj aksd hakjshd akjsdh akjshd aksd asjdna jksnd jaknsd kansd kand kjansd kjansdk jansd kansdk naskjd naksjdn ak djnaks dnaskj dn"
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
        drawDesign()
        makeDetail()

        
        
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
