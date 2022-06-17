//
//  MainVC.swift
//  NewsApp-MVVM
//
//  Created by Mehmet Bilir on 16.06.2022.
//

import UIKit
import SnapKit

protocol MainVCProtocol {
    func saveData(datas : [Article])
    
    
}

final class MainVC: UIViewController, MainVCProtocol {

    
    
    private let tableView:UITableView = UITableView()
    private var rowHeight : CGFloat?
    var articles: [Article] = []
    var viewModel:MainViewModel = MainViewModel()
    var detailsVCDelegate : DetailsVCProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.mainVCDelegate = self
        viewModel.fetchNews()
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
    
    func saveData(datas: [Article]) {
        
        articles = datas
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    
    
    

    

}

extension MainVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier) as! DetailsTableViewCell
        cell.setup(article: articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsVCViewController()
        detailsVCDelegate = vc
        detailsVCDelegate?.setup(news: articles[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
        
        
        
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
