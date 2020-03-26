import UIKit
import Firebase

class AppData: NSObject {
    static let sharedInstance = AppData()
    
    var updateNode: DatabaseReference!
    var currentList: Array<UpdateClass>!
    
    public override init() {
        FirebaseApp.configure()
        updateNode = Database.database().reference()
        currentList = Array<UpdateClass>()
    }
}
