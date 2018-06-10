import RealmSwift

class MenuItem: Object {
    @objc dynamic var identifier: Int = 0
    @objc dynamic var name = ""
    @objc dynamic var sales = 0
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
}
