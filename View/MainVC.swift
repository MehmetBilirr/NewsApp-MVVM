//
//  MainVC.swift
//  NewsApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import UIKit
import SnapKit

final class MainVC: UIViewController {
    private let tableView:UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    private func Configure() {
        view.addSubview(tableView)
        makeTableView()
    }
    
    private func drawDesign() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "News"
        
        
    }
    
    
    

    

}

extension MainVC {
    func makeTableView() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}
