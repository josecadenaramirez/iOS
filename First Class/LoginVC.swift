//
//  LoginVC.swift
//  First Class
//
//  Created by José Cadena on 11/07/18.
//  Copyright © 2018 José Cadena. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var vwBlockUser: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var edtPassword: UITextField!
    @IBOutlet weak var edtEmail: UITextField!
    
    let usr = User()
    var alert = UIAlertController()
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.isHidden = true
        vwBlockUser.isHidden = true
        
        let tap2: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func createUser(){
        email = edtEmail.text!
        password = edtPassword.text!
        print(String(NSLocalizedString("NewUser", comment: "")) + email)
        usr.saveEmailPassword(email: email, pass: password)
    }
    
    
    @IBAction func clickSignUp(_ sender: Any) {
        createUser()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "WelcomeToMyAppID") as! WelcomeToMyAppVC
        self.present(vc, animated: true, completion: nil)
    }
}
