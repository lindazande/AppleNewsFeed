//
//  SavedNewsTableTableViewController.swift
//  AppleNewsFeed
//
//  Created by linda.zande on 11/08/2021.
//

import UIKit
import CoreData

class SavedNewsTableViewController: UITableViewController {
    var savedItems = [Items]()
    var context: NSManagedObjectContext?
    
    //var webURLStringForSource = Int()
    //editButtonTitle
    
    @IBOutlet weak var editButtonTitle: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        loadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        
    }
    
    func saveData(){
        do{
            try context?.save()
            basicAlert(title: "Saved!", message: "To see your saved article, go to aved tab bar")
        }catch{
            print(error.localizedDescription)
        }
        loadData()
    }
     
    func loadData(){
        
        let request: NSFetchRequest<Items> = Items.fetchRequest()
        do {
            savedItems = try (context?.fetch(request))!
            tableView.reloadData()
        }catch{
            fatalError("Error in retrieving Saved Items")
        }
    }
        
      
    @IBAction func infoButtonTapped(_ sender: Any) {

    
    //basic alerts
}
//MARK: -#warning("change the title of editButtonTitle")
        //editButtonTapped
    @IBAction func editButtonTapped(_ sender: Any) {
    tableView.isEditing = !tableView.isEditing
        if tableView.isEditing {
            editButtonTitle.title = "Save"
        }else{
            editButtonTitle.title = "Edit"
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return savedItems.count
    }

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "savedFeedCell", for: indexPath) as? NewsTableViewCell else{
        return UITableViewCell()
    }
            
        let item = savedItems[indexPath.row]
        cell.newsTitleLabel.text = item.newsTitle
        cell.newsTitleLabel.numberOfLines = 0
    
    if let image = UIImage(data: item.image!){
        cell.newsImageView.image = image
    }
 return cell
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "WebViewController", for: indexPath)
        
       // func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //   let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
         //   guard let vc = storyboard.instantiateViewController(identifier: "WebViewController") as? DetailViewController else {
             //   return
           // }
         //   let item = items[indexPath.row]
            
         //   vc.contentString = item.description
         //   vc.titleString = item.title
         //   vc.webURLString = item.url
         //   vc.newsImage = item.image
            
            //present(vc, animanted: true, completion: nil)
        //    navigationController?.pushViewController(vc, animated: true)
       // }

       
    }
    //MARK: -#warning(".delete")
    


    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let item = savedItems[indexPath.row]
            self.context?.delete(item)
            
            let alertController = UIAlertController(title: "Delete", message: "Are you sure you want to delete this Item?", preferredStyle: .alert)
          alertController.addTextField { textField in
            print(textField)
           }
           let addActionButton = UIAlertAction(title: "Yes", style: .default) { alertAction in
                
              let textField = alertController.textFields?.first
               let entity = NSEntityDescription.entity(forEntityName: "Grocery", in: self.manageObjectContext!)
             //   let grocery = NSManagedObject(entity: entity!, insertInto: self.manageObjectContext)
                
              //  grocery.setValue(textField?.text, forKey: "item")
             //   self.saveData()

                //  self.groceries.append(textField!.text!)
                //self.tableView.reloadData()
                
          //  }//add action
         //   let cancelButton = UIAlertAction(title: "cancel", style: .destructive, handler: nil)
            
          //  alertController.addAction(addActionButton)
          //  alertController.addAction(cancelButton)
           //  present(alertController, animated: true, completion: nil)
     //   }
        }
    }
           // tableView.deleteRows(at: [indexPath], with: .fade)
      //  } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      
    

    
    //Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let row = savedItems.remove(at: fromIndexPath.row)
        savedItems.insert(row, at: to.row)
    }



    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
