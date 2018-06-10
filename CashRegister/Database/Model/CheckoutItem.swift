import RealmSwift

class CheckoutItem: Object {
    @objc dynamic var menuItem: MenuItem?
    @objc dynamic var checkout: Checkout?
    @objc dynamic var count = 0
    
    required convenience init(menuItem: MenuItem, checkout: Checkout) {
        self.init()
        self.menuItem = menuItem
        self.checkout = checkout
    }
}
