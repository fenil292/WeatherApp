//
//  ViewController.swift
//  MyStockApp
//
//  Created by RG on 16/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let myTableView = UITableView()
    
    private var stockArray = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stocks App"
        
        ApiHandler.shared.getStockPrice{
            stocks in
            self.stockArray = stocks
            DispatchQueue.main.async {
                //print("\(self.stockArray[0].name)")
                self.myTableView.reloadData()
            }
            
        }
        
        view.addSubview(myTableView)
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTableView.frame = view.frame
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "StockCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath)
        let st = stockArray[indexPath.row]
        cell.textLabel?.text = "\(st.name) \t High: \(st.country) \t Low: \(st.region)"
        
        return cell
    }
}

