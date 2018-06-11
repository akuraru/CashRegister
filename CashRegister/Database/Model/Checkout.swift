import RealmSwift

class Checkout: Object {
    let items = List<CheckoutItem>()
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
            self.items.append(CheckoutItem(menuItem: item, checkout: self))
        }
    }
    
    func total() -> Int {
        return items.reduce(0) {(total, item) in total + item.count * item.menuItem!.sales }
    }
}
