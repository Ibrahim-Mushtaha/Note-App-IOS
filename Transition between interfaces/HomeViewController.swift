//
//  HomeViewController.swift
//  Transition between interfaces
//
//  Created by Ibrahim Mushtaha on 12/04/2021.
//

import UIKit

class HomeViewController: UIViewController, DataChange {
    
    
    func onChangeData() {
        fetchData()
    }
    
    
    @IBOutlet weak var uiTableView: UITableView!
    
    var data:[Line] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        uiTableView.dataSource = self
        uiTableView.delegate = self
        
        // Do any additional setup after loading the view.
        fetchData()
        //addNote()
    }
    
    
    @IBAction func btnAddNote(_ sender: UIButton) {
       moveToAddNote(line: nil)
    }
    
    fileprivate func fetchData(){
        do{
            self.data = try context.fetch(Line.fetchRequest())
            DispatchQueue.main.async {
                self.uiTableView.reloadData()
            }

        }catch{
            
        }
    }
 
    fileprivate func addNote(){
        let newLine = Line(context: self.context)
        newLine.name = "Omar"
        newLine.note = "test note"
        do{
            try self.context.save()
        }catch{
            
        }
        self.fetchData()
    }
    
    
    func moveToAddNote(line:Line?){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let viewC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! AddNoteViewController
        viewC.onChange = self
        viewC.line = line
               present(viewC, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        let text = data[indexPath.row].name
        cell.textLabel?.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        moveToAddNote(line: data[indexPath.row])
    	

    }
    
    // to delete the item
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        let lineToRemove = self.data[indexPath.row]
        do{
            try self.context.delete(lineToRemove)
        }catch{
            
        }
        self.fetchData()
    }
    
    
}
