//
//  YRLanguageTableViewCell.swift
//  YRCollectionViewInTableView
//
//  Created by Yogesh Rathore on 20/04/22.
//

import UIKit

protocol LanguageCollectionViewDelegate: NSObject {
    
    func collectionViewDidSelect(collectionViewCell: YRLanguageCollectionViewCell?, index: Int, didTapInTableViewCell: YRLanguageTableViewCell)
}
class YRLanguageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var languageCollectionView: UICollectionView!
    
    weak var languageCellDelegate: LanguageCollectionViewDelegate?
    
    let languageArray = ["Swift", "Objective-C", "Java", "HTML", "JvaScript", "Python", "C", "C++", "Jquery", "SQL"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.minimumInteritemSpacing = 5.0
        
        self.languageCollectionView.collectionViewLayout = flowLayout
        
        // Show scrollIndicator
       // self.languageCollectionView.showsHorizontalScrollIndicator = false
        
        // To Enable scroll
        //self.languageCollectionView.isScrollEnabled = false
        
        self.languageCollectionView.delegate = self
        self.languageCollectionView.dataSource = self
        
        // Register cell
        let cellNib = UINib(nibName: "YRLanguageCollectionViewCell", bundle: nil)
        self.languageCollectionView.register(cellNib, forCellWithReuseIdentifier: "YRLanguageCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension YRLanguageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // if you want to show specific number of cells in Row
        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: size)
       // return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YRLanguageCollectionViewCell", for: indexPath) as! YRLanguageCollectionViewCell
        
        cell.languageLabel.text = languageArray[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? YRLanguageCollectionViewCell
        self.languageCellDelegate?.collectionViewDidSelect(collectionViewCell: cell, index: indexPath.item, didTapInTableViewCell: self)
    }
    
    
    
}
