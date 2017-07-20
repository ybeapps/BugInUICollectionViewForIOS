//
//  ViewController.swift
//  TestBugOnCollectionViewController
//
//  Created by יצחק בן-עזרא on 26.5.2016.
//  Copyright © 2016 יצחק בן-עזרא. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    @available(iOS 10.0, *)
    func callWithDelay(_ seconds: Double, action: @escaping ()->()) {
        let delay = seconds * Double(NSEC_PER_SEC)
        let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time) {
            action()
        }
        
        Timer.scheduledTimer(withTimeInterval: seconds, repeats: false) { (timer) in
            action()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let target = IndexPath(row: 1, section: 1)
        
        let scroll = {
            self.collectionView?.scrollToItem(at: target, at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
            if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                print ("updating layout to big cell")
                layout.itemSize = self.collectionView!.frame.size
            }
        }
        
        if #available(iOS 10.0, *) {
            callWithDelay(10) {
                scroll()
            }
        } else {
            // Fallback on earlier versions
            scroll()
        }
//        collectionView?.scrollToItem(at: IndexPath(row: 4, section: 3), at: [], animated: false)
    }

}

//MARK: DataSource implementation
extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let myCell = newCell as? MyCell {
            myCell.label.text = "section \(indexPath.section) : item \(indexPath.item.description)"
        }
        
        return newCell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
}

class MyCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    func rand() -> Float {
        return Float((arc4random() % 100)) / 100
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(colorLiteralRed: rand(), green: rand(), blue: rand(), alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.init(colorLiteralRed: rand(), green: rand(), blue: rand(), alpha: 1)
    }
}
