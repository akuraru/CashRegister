import RealmSwift

class CheckoutItem: Object {
    @objc dynamic var menuItem: MenuItem?
    @objc dynamic var count = 0
    
    required convenience init(menuItem: MenuItem) {
        self.init()
        self.menuItem = menuItem
    }
}
