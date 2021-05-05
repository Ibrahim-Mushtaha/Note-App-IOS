//
//  DetailsViewController.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 17/04/2021.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    var line :Line?
    var onChange:DataChange!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        if  line == nil {
            line = Line(context: self.context)
        }
        
    
            txtTitle.text = line!.name
            txtDescription.text = line!.note
            btnAdd.setTitle("Update", for: .normal)
    
        btnAdd.addCorner()
        btnAdd.dropShadow()
       
}
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        if line == nil {
            line = Line(context: self.context)
        }
       
        line!.name = txtTitle.text!
        line!.note = txtDescription.text!
        
        do{
            try self.context.save()
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
                self.onChange.onChangeData()
            }
        }catch{
            
        }
        
    }
    
}
protocol DataChange {
    func onChangeData()
}
