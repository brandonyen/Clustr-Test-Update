import UIKit

class UpdateClass: NSObject {
    var updateName : String!
    var updateText : String!
    
    init(inputUpdateName:String, inputUpdateText:String) {
       updateName = inputUpdateName
       updateText = inputUpdateText
    }
}
