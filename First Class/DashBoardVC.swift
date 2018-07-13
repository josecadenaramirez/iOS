//
//  DashBoardVC.swift
//  First Class
//
//  Created by José Cadena on 12/07/18.
//  Copyright © 2018 José Cadena. All rights reserved.
//

import UIKit

class DashBoardVC: UIViewController {
    
    @IBOutlet weak var heightCollection: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightStacks: NSLayoutConstraint!
    @IBOutlet weak var vwStacks: UIView!
    @IBOutlet weak var HeightTableView: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var buttons: Array<UIButton>?
    @IBOutlet weak var vwBtnSelected: UIView!
    
    let usr = User()
    var names = [String]()
    var arrayDescription = [String]()
    var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        usr.reloadData()
        for (index, btn) in (buttons?.enumerated())!{
            btn.tag = index
            btn.backgroundColor = .red
            btn.clipsToBounds = true
            btn.layer.cornerRadius = 5
            btn.addTarget(self, action: #selector(clickButtons(sender:)), for: .touchUpInside)
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        names = ["juan", "jose","eduardo", "manuel", "alexander", "ramon", "elias", "rosa"]
        arrayDescription = ["juan", "jose","eduardo", "manuel", "alexander", "ramon", "elias", "rosa"]
        
        images = [#imageLiteral(resourceName: "Settings-3"),#imageLiteral(resourceName: "Pen"),#imageLiteral(resourceName: "img_splash"),#imageLiteral(resourceName: "Hot-dog"),#imageLiteral(resourceName: "Bg"),#imageLiteral(resourceName: "Store"),#imageLiteral(resourceName: "Musical-note-1"),#imageLiteral(resourceName: "Lock-square")]
        
        tableView.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
        HeightTableView.priority = .defaultLow
        heightStacks.priority = .defaultHigh
        collectionView.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
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
                self.HeightTableView.priority = .defaultHigh
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
        cell.btnAny.tag = indexPath.row
        cell.btnAny.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        HeightTableView.constant = tableView.contentSize.height
        view.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("nombre es: \(names[indexPath.row])")
    }
    
    @objc func buttonClicked(sender:UIButton){
        print("nombre presionado: \(names[sender.tag])")
        createAlert(title: usr.email, message: usr.password)
    }
    
    func createAlert(title:String, message: String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction.init(title: "cancel", style: .cancel){
            UIAlertAction in
            print("accion de cancelar")
        }
        
        let defaultaction = UIAlertAction.init(title: "default", style: .default){
            UIAlertAction in
            print("accion de default")
        }
        
        let destructive = UIAlertAction.init(title: "destructive", style: .destructive){
            UIAlertAction in
            print("accion de destructive")
        }
        
        //defaultaction.setValue(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), forKey: "titleTextColor")
        alert.view.tintColor = .green
        alert.addAction(cancel)
        alert.addAction(defaultaction)
        alert.addAction(destructive)
        present(alert, animated: true, completion: nil)
    }
    
}

extension DashBoardVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionCell
        cell.imgProfile.image = images[indexPath.item]
        /*heightCollection.constant = collectionView.contentSize.height
        heightStacks.priority = .defaultLow
        HeightTableView.priority = .defaultHigh
        heightCollection.priority = .defaultLow*/
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("el item presionado es:\(indexPath.item)")
    }
    
}


