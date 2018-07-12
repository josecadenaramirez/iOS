//
//  DashBoardVC.swift
//  First Class
//
//  Created by José Cadena on 12/07/18.
//  Copyright © 2018 José Cadena. All rights reserved.
//

import UIKit

class DashBoardVC: UIViewController {
    
    @IBOutlet weak var heightStacks: NSLayoutConstraint!
    @IBOutlet weak var vwStacks: UIView!
    @IBOutlet weak var HeigthTableView: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var buttons: Array<UIButton>?
    @IBOutlet weak var vwBtnSelected: UIView!
    
    var names = [String]()
    var arrayDescription = [String]()
    var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        for (index, btn) in (buttons?.enumerated())!{
            btn.tag = index
            btn.addTarget(self, action: #selector(clickButtons(sender:)), for: .touchUpInside)
        }
        
        names = ["juan", "jose","eduardo", "manuel", "alexander", "ramon", "elias", "rosa"]
        arrayDescription = ["juan", "jose","eduardo", "manuel", "alexander", "ramon", "elias", "rosa"]
        
        images = [#imageLiteral(resourceName: "Settings-3"),#imageLiteral(resourceName: "Pen"),#imageLiteral(resourceName: "Box-open"),#imageLiteral(resourceName: "Hot-dog"),#imageLiteral(resourceName: "Bg"),#imageLiteral(resourceName: "Store"),#imageLiteral(resourceName: "Musical-note-1"),#imageLiteral(resourceName: "Lock-square")]
        
        tableView.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        HeigthTableView.priority = .defaultLow
        heightStacks.priority = .defaultHigh
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func clickButtons(sender:UIButton){
        let tag = sender.tag
        UIView.animate(withDuration: 0.35, animations: {
            self.vwBtnSelected.center.x = self.buttons![tag].center.x
            if tag == 1{
                self.vwStacks.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
                self.tableView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.heightStacks.priority = .defaultLow
                self.HeigthTableView.priority = .defaultHigh
            }
            self.view.layoutIfNeeded()
        },completion:nil)
    }

}

extension DashBoardVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! firstClassCell
        cell.imgProfile.image = images[indexPath.row]
        cell.lblName.text = names[indexPath.row]
        cell.lblDescription.text = arrayDescription[indexPath.row]
        HeigthTableView.constant = tableView.contentSize.height
        view.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}


