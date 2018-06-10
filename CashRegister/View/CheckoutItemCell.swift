import Foundation
import UIKit

class CheckoutItemCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sales: UILabel!
    @IBOutlet weak var count: UILabel!
    
    func updateView(_ checkoutItem: CheckoutItem) {
        name.text = checkoutItem.menuItem?.name
        sales.text = String(checkoutItem.menuItem?.sales ?? 0)
        count.text = String(checkoutItem.count)
    }
}
