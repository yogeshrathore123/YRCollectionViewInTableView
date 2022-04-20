//
//  TableViewCell+Extension.swift
//  YRCollectionViewInTableView
//
//  Created by Yogesh Rathore on 20/04/22.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func registerCellNibXib(with tableView: UITableView) {
        let nib = UINib(nibName: self.storyboardID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: self.storyboardID)
    }
}
