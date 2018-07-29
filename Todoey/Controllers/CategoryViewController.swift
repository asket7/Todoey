//
//  CategoryViewController.swift
//  Todoey
//
//  Created by iMac 2012 on 28.07.2018.
//  Copyright © 2018 iMac2012. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

        loadCategories()
        
    }
    
    //MARK: - TableView Datasourse Methods

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)

//        let item = itemArray[indexPath.row]
//
//        cell.textLabel?.text = item.title
        
        cell.textLabel?.text = categories[indexPath.row].name
//
//        cell.accessoryType = item.done ? .checkmark : .none
//
        return cell
//
    }
    
    //MARK: - TableView Delegate Methods
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            performSegue(withIdentifier: "goToItems", sender: self)

//            //        context.delete(itemArray[indexPath.row])
//            //        itemArray.remove(at: indexPath.row)
//
//            itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//
//            saveItems()
//
//            tableView.deselectRow(at: indexPath, animated: true)
//
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    //MARK: - Data Manitulation Methods
    
    func saveCategories() {

        do {
            try context.save()
        } catch {
            print("Error saving category, \(error)")
        }
        
            tableView.reloadData()
        
    }

    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {

        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching data from context, \(error)")
        }
        
        tableView.reloadData()

    }
    
    //MARK: - Add New Categories
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add", style: .default) { (action) in

//            //what will happen once the user clicks the Add Item button on our UIAlert

            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
//            newItem.done = false
            self.categories.append(newCategory)
            self.saveCategories()
        }

        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
    
        present(alert, animated: true, completion: nil)

    }

    
    

}
