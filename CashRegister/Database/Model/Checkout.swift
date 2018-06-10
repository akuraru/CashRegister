import RealmSwift

class Checkout: Object {
    let checkoutItem = List<CheckoutItem>()
    @objc dynamic var pay = 0
    @objc dynamic var change = 0
    @objc dynamic var state = State.order.rawValue
    @objc dynamic var createAt = Date()
    
    enum State: Int {
        case order
        case checkout
    }
    convenience init(with realm: Realm) {
        self.init()
        realm.objects(MenuItem.self).forEach { (item) in
            self.checkoutItem.append(CheckoutItem(menuItem: item, checkout: self))
        }
    }
}
