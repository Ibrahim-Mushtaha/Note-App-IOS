//
//  HomeViewController.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 12/04/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var uiToolbarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = uiToolbarView.frame
        rectShape.position = uiToolbarView.center
        rectShape.path = UIBezierPath(roundedRect: uiToolbarView.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 12, height: 12)).cgPath

        uiToolbarView.layer.backgroundColor = UIColor.orange.cgColor
        //Here I'm masking the textView's layer with rectShape layer
        uiToolbarView.layer.mask = rectShape
        uiToolbarView.dropShadow()
        // Do any additional setup after loading the view.
    }
    

    
    


    
}
