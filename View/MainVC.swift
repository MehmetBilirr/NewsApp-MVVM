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
    private var rowHeight : CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Configure()
        
    }
    
    private func Configure() {
        view.addSubview(tableView)
        makeTableView()
        drawDesign()
    }
    
    private func drawDesign() {

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: DetailsTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        //tableView.rowHeight = self.view.frame.size.height * 0.15
       
        view.backgroundColor = .systemBackground
        navigationItem.title = "News"
        
        
        
    }
    
    
    

    

}

extension MainVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier) as! DetailsTableViewCell
        
        
        
        
        return cell
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
