//
//  ShareLinkViewController.swift
//  BareBonesFirebase
//
//  Created by Jason Gresh on 2/13/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ShareLinkViewController: UIViewController {
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    var databaseReference: FIRDatabaseReference!
    var user: FIRUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.databaseReference = FIRDatabase.database().reference().child("links")
        FIRAuth.auth()?.signInAnonymously(completion: { (user: FIRUser?, error: Error?) in
            if let error = error {
                print(error)
            }
            else {
                self.user = user
            }
        })
    }

    @IBAction func shareLink(_ sender: UIButton) {
        shareToFirebase()
    }
    
    func shareToFirebase() {
        let linkRef = databaseReference.childByAutoId()
        let link = Link(key: linkRef.key, url: self.linkTextField.text!, comment: self.commentTextView.text)
        let dict = link.asDictionary

        linkRef.setValue(dict) { (error, reference) in
            if let error = error {
                print(error)
            }
            else {
                print(reference)
                self.dismiss(animated: true, completion: nil)
            }
        }
//        linkRef.setValue(dict) { (error: Error?, reference: FIRDatabaseReference) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print(reference)
//                self.dismiss(animated: true, completion: nil)
//            }
//        }
    }
}
