//
//  YRHomeViewController.swift
//  YRCollectionViewInTableView
//
//  Created by Yogesh Rathore on 20/04/22.
//

import UIKit

class YRHomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerTableViewNibClass()
        setUpTableView()
    }

    private func setUpTableView() {
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 200
    }
    
    private func registerTableViewNibClass() {
        YRLanguageTableViewCell.registerCellNibXib(with: homeTableView)
    }
    
}

extension YRHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: YRLanguageTableViewCell.storyboardID, for: indexPath) as! YRLanguageTableViewCell
        
        
        
        return cell
        
        
    }
    
    
    
    
}


