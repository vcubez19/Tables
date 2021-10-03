//
//  ViewController.swift
//  Tables
//
//  Created by Vincent Cubit on 9/27/21.
//


import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var myTodoTableView: UITableView!
    
    
    // Data and date formatter
    private var items: [ Todo ] = [  ]
    private let formatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.myTodoTableView.delegate = self
        self.myTodoTableView.dataSource = self
        
        
        self.formatter.dateStyle = .short
        self.formatter.timeStyle = .short
        
        
    }
    
    
    @IBAction func addTodo(_ sender: Any) {
        
        
        let addTodoPopup = UIAlertController(title: "Todo",
                                             message: "Add a Todo",
                                             preferredStyle: .alert)
        
        
        addTodoPopup.addTextField { (UITextField) in
            UITextField.placeholder = "Todo"
        }
        
        
        let addTodoAction = UIAlertAction(title: "Add",
                                          style: .default) { (UIAlertAction) in
            
            
            let currentDateAndTime = self.formatter.string(from: Date())
            
            
            let fullTodo = Todo(title: addTodoPopup.textFields![0].text!, date: currentDateAndTime)
            
            
            self.items.append(fullTodo)
            self.myTodoTableView.reloadData()
            
            
        }
        
        
        addTodoPopup.addAction(addTodoAction)
        
        
        present(addTodoPopup, animated: true, completion: nil)
        
        
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Todos"
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
}


extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        cell.textLabel?.text = self.items[indexPath.row].title
        cell.detailTextLabel?.text = self.items[indexPath.row].date
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

