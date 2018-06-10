//
//  ViewController.swift
//  CashRegister
//
//  Created by akuraru on 2018/06/10.
//  Copyright © 2018年 akuraru. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UICollectionViewController {
    var checkoutItems: Results<CheckoutItem>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkoutItems = DatabaseManager.shared().orderCheckoutItems()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return checkoutItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CheckoutItemCell
        let checkoutItem = checkoutItems[indexPath.row]
        cell.updateView(checkoutItem)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let checkoutItem = checkoutItems[indexPath.row]
        try! checkoutItems.realm?.write {
            checkoutItem.count += 1
        }
        collectionView.reloadItems(at: [indexPath])
    }
}

