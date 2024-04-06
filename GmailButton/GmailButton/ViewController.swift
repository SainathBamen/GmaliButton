//
//  ViewController.swift
//  GmailButton
//
//  Created by mac on 4/5/24.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    let tableView = UITableView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 25
        
        // Setting up the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        // Setting up the button
        button.setTitle("My Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.frame = CGRect(x: 20, y: 50, width: 10, height: 30) // Initial size
        view.addSubview(button)
        
        // Set up UIScrollViewDelegate
        tableView.delegate = self
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        // Calculate the new button height based on the scroll offset
        let newButtonHeight = max(40 - yOffset, 15) // Minimum height is 20
        
        // Update the button's frame
        button.frame = CGRect(x: 230, y: 700, width: 100, height: newButtonHeight)
    }
    
    // Button action
    @objc func buttonTapped() {
        print("Button tapped!")
    }
}
