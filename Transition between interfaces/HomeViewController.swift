//
//  HomeViewController.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 12/04/2021.
//

import UIKit

struct User {
    var name:String,
     jobTitle:String,
     about:String
}
class HomeViewController: UIViewController {
    
    @IBOutlet weak var uiTableView: UITableView!
    
    
    let data = [0:["rwer"],1:["qesdfa"]]
    let dataUser = [User(name: "ahmed", jobTitle: "Ux/Ui designer", about: "erwth iowertkjgfsklj"),User(name: "ali", jobTitle: "IOS developer", about: "ertwer tghdf h dfg")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        uiTableView.dataSource = self
    
        // Do any additional setup after loading the view.
    }
    
    
}

extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        let text = dataUser[indexPath.row].name
        cell.textLabel?.text = text
        
        return cell
    }
    
    
}
