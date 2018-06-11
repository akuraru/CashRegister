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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkout = DatabaseManager.shared().orderCheckout()
        collectionView?.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return checkout.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CheckoutItemCell
        let checkoutItem = checkout.items[indexPath.row]
        cell.updateView(checkoutItem)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let checkoutItem = checkout.items[indexPath.row]
        checkoutItem.count += 1
        collectionView.reloadItems(at: [indexPath])
    }
    @IBAction func tapCheckout(_ sender: Any) {
        let viewController = CheckoutViewController.viewController(with: checkout)
        navigationController!.pushViewController(viewController, animated: true)
    }
}

