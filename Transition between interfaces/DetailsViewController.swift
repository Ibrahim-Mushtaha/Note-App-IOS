//
//  DetailsViewController.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 17/04/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    var category:Category?
    
    @IBOutlet weak var uiName: UILabel!
    @IBOutlet weak var uiDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = self.category{
            uiName.text = category.name
            uiDescription.text = category.about
        }
        // Do any additional setup after loading the view.
    }
    

}
