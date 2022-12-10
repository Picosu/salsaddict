//
//  ViewController.swift
//  Salsaddict
//
//  Created by Maxence de Cussac on 14/05/2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    var shouldPerformSegue = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Test Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let numbers = [0]
        let _ = numbers[1]
    }
    
    @IBAction func login(_ sender: AnyObject) {
        if !shouldPerformSegue {
            loginFirebase()
        }
    }

    func loginFirebase() {
        let email = "maxence.decussac@gmail.com"
        let password = "123456"
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            guard let authResult = authResult else { return }
            strongSelf.shouldPerformSegue = true
            print("\(authResult), \(error)")

        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return shouldPerformSegue
    }
    /*
     
     Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
     guard let strongSelf = self else { return }
     // ...
     }
     **/
}
