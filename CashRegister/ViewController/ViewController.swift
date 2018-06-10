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
    var checkout: Checkout!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkout = DatabaseManager.shared().orderCheckout()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return checkout.checkoutItem.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CheckoutItemCell
        let checkoutItem = checkout.checkoutItem[indexPath.row]
        cell.updateView(checkoutItem)
        return cell
    }
}

