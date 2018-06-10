import Foundation

struct ApplicationManager {
    static let shared = ApplicationManager()
    
    let database = DatabaseManager()
    let update = UpdateManager()
}
