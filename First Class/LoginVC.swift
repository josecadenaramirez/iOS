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
    
    var alert = UIAlertController()
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.isHidden = true
        vwBlockUser.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createUser(){
        email = edtEmail.text!
        password = edtPassword.text!
        print(String(NSLocalizedString("NewUser", comment: "")) + email)
    }
    
    
    @IBAction func clickSignUp(_ sender: Any) {
        createUser()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeToMyAppID") as! WelcomeToMyAppVC
        if email.count < 5{
            alert = showAlertOk(title: "MIAPP", message: "verifica tu contraseña")
        }
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertOk(title:String, message:String)->UIAlertController{
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert )
        let okAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        let okAction2 = UIAlertAction.init(title: "Ok2", style: .destructive, handler: nil)
        alertController.addAction(okAction2)
        let okAction3 = UIAlertAction.init(title: "O3", style: .cancel, handler: nil)
        alertController.view.tintColor = .green
        
        
        
        let alertac = UIAlertAction.init(title: "", style: .destructive){
            UIAlertAction in self.createUser()
        }
        
        okAction.setValue(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), forKey: "titleTextColor")
        alertController.addAction(okAction3)
        return alertController
    }
    
}
