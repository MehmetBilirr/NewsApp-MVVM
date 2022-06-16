//
//  DetailsTableViewCell.swift
//  NewsApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import UIKit
import SnapKit

class DetailsTableViewCell: UITableViewCell {

    
    
    private let titleLbl:UILabel = UILabel()
    private let detailLbl:UILabel = UILabel()
    static let identifier:String = "DetailsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
         
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.titleLbl.font = .boldSystemFont(ofSize: 18)
            self.titleLbl.textColor = .red
            self.detailLbl.textColor = .systemGray
            
        }
    }
    
    private func configure() {
        contentView.addSubview(titleLbl)
        titleLbl.numberOfLines = 0
        titleLbl.lineBreakMode = .byWordWrapping
        contentView.addSubview(detailLbl)
        detailLbl.numberOfLines = 0
        detailLbl.lineBreakMode = .byWordWrapping
        
        makeTitle()
        makeDetail()
        drawDesign()
    }
    
    
    
    
    

}

extension DetailsTableViewCell {
    
    private func makeTitle() {
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview()
            
            

        }
                
        
        
        }
    
    private func makeDetail() {
        detailLbl.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(70)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview()
            
            make.bottom.equalTo(contentView)
            
            
        }
    }
    
}
    
        
        
        
            
    
   
    
