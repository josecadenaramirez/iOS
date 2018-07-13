//
//  User.swift
//  First Class
//
//  Created by José Cadena on 13/07/18.
//  Copyright © 2018 José Cadena. All rights reserved.
//

import Foundation
class User{
    //llaves
    
    let userEmail                   = "email"
    let userPassword                = "password"
    
    //variables
    
    var email                       = ""
    var password                    = ""
    
    //variable para compartir
    let defaults = UserDefaults.standard

    //refrescar datos omitir nil
    public func reloadData(){
        if defaults.object(forKey: userEmail) != nil {email = defaults.string(forKey: userEmail)!}
        else{email = ""}
        if defaults.object(forKey: userPassword) != nil {password = defaults.string(forKey: userPassword)!}
        else{password = ""}
    }
    //func para guardar
    public func saveEmailPassword(email:String, pass:String){
        defaults.set(email, forKey: userEmail)
        defaults.set(pass, forKey: userPassword)
    }
}
