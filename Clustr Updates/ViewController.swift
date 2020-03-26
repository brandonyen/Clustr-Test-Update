//
//  ViewController.swift
//  Clustr Updates
//
//  Created by Brandon Yen on 3/21/20.
//  Copyright © 2020 Brandon Yen. All rights reserved.
//

import UIKit
import Firebase

//Add UITableViewDataSource
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var titleText : String = "";
    var updateText : String = "";
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var updateField: UITextField!
    
    @IBOutlet weak var listsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//The following function is for template purposes only, not meant to be run
    /*
    func firebaseTest() {
        Auth.auth().createUser(withEmail: "test@email.com", password: "slkdfjoiwwlkd")
        { (user, error) in
            if (error == nil)
            {
                self.alertShowMethod(title: "Success!", message: "You have successfully registered an account on Firebase")
            }
        }
        
        let testString = "Test String"
        AppData.sharedInstance.updateNode.child("updates").setValue(testString)
    }

*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.currentList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listsCell", for: indexPath)
        
        let thisList = AppData.sharedInstance.currentList[indexPath.row] as UpdateClass
        
        cell.textLabel?.text = thisList.updateName
        cell.detailTextLabel?.text = thisList.updateText
        
        return cell
    }
    
    @IBAction func getText(_ sender: Any) {
        let titleTxt : String? = titleField.text
        titleText = titleTxt!
        let updateTxt : String? = updateField.text
        updateText = updateTxt!
    }
    
    @IBAction func publishAction(_ sender: Any) {
        AppData.sharedInstance.updateNode.child("updates").setValue([titleText : updateText])
        self.publishActionHelper()
        let alert = UIAlertController(title: "Update Published!", message: "Your update has successfully been pushed to Firebase.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func publishActionHelper() {
        let newList = UpdateClass(inputUpdateName: titleText, inputUpdateText: updateText)
        AppData.sharedInstance.currentList.append(newList)
        self.listsTableView.reloadData()
    }

    func alertShowMethod(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func syncUpdates(_ sender: Any) {
        
    }
    
}
