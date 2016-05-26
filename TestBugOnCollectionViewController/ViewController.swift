//
//  ViewController.swift
//  TestBugOnCollectionViewController
//
//  Created by יצחק בן-עזרא on 26.5.2016.
//  Copyright © 2016 יצחק בן-עזרא. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.scrollToItemAtIndexPath(NSIndexPath(forRow: 4, inSection: 3), atScrollPosition: .None, animated: false)
    }

}

//MARK: DataSource implementation
extension ViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let newCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        if let myCell = newCell as? MyCell {
            myCell.label.text = "\(indexPath.section):\(indexPath.item.description)"
        }
        
        return newCell
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 10
    }
}

class MyCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
}