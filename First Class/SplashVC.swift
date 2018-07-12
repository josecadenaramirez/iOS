//
//  SplashVC.swift
//  First Class
//
//  Created by José Cadena on 10/07/18.
//  Copyright © 2018 José Cadena. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    @IBOutlet weak var imgSplash: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgSplash.alpha = 1

        imgSplash.transform = CGAffineTransform(scaleX: 1, y: 1)
        self.imgSplash.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        
        UIView.animate(withDuration: 2, animations: {
            self.imgSplash.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion:{finished in
            
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeID") as! HomeVC
            
            let transition = CATransition()
            transition.duration = 1.35
            transition.type = kCATransitionReveal
            transition.subtype = kCATransitionFromRight
            self.view.window?.layer.add(transition, forKey: nil)
            self.present(vc, animated: false, completion: nil)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

}
