//
//  HomeViewController.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 12/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var uiTableView: UITableView!
    
    //var data:[Line] = []
    
    let dataCategory = [Category(about: "chemistry qwerw rqwerddsaf dsffasf", name: "ahmed"),Category(about: "math dsf qewrt rtret wert we ", name: "ali"),Category(about: "tech dasfsd fasdf adf asf", name: "omar")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        uiTableView.dataSource = self
        uiTableView.delegate = self
    
        // Do any additional setup after loading the view.
    }
    
    
}

extension HomeViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        let text = dataCategory[indexPath.row].name
        cell.textLabel?.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let viewC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailsViewController
        
        viewC.category = dataCategory[indexPath.row]
               present(viewC, animated: true, completion: nil)
    

    

    }
    
    
}
