//
//  ViewController.swift
//  AntRoomies
//
//  Created by Winston Lan on 2/17/18.
//  Copyright © 2018 winstonlan. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    // MARK: IBActions
    @IBAction func logoutDidTouch(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Variables
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print(user.uid)
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

