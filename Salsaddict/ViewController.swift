//
//  ViewController.swift
//  Salsaddict
//
//  Created by Maxence de Cussac on 14/05/2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
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
        let email = "maxence.decussac@gmail.com"
        let password = "123456"
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            print("\(authResult), \(error)")
            guard let strongSelf = self else { return }
        }
    }
    /*
     
     Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
     guard let strongSelf = self else { return }
     // ...
     }
     **/
}
