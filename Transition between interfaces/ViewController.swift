//
//  ViewController.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 12/04/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiContanier: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        uiContanier.dropShadow()
        uiContanier.addCorner()
    }

    @IBAction func btnCreateNew(_ sender: UIButton) {
        performSegue(withIdentifier: "actionSequa", sender: nil)
    }
    
    // to send date between the two uiController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "actionSequa" {
            if let details = segue.destination as? SignUpViewController{
                
            }
        }
    }
    
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addCorner(value:Int = 4){
        layer.masksToBounds = true
        layer.cornerRadius = 4
    }
}
