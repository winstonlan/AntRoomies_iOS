//
//  LoginViewController.swift
//  AntRoomies
//
//  Created by Winston Lan on 2/17/18.
//  Copyright © 2018 winstonlan. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    // MARK: Actions
    @IBAction func signInDidTouch(_ sender: Any) {
        
    }
    
    @IBAction func signUpDidTouch(_ sender: Any) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            if Auth.auth().currentUser != nil {
                self.performSegue(withIdentifier: "loggedInSegue", sender: self)
            } else {
                print("Failed to sign in")
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
