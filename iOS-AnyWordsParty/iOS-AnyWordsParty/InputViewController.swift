//
//  InputViewController.swift
//  iOS-AnyWordsParty
//
//  Created by 1 on 2022/02/03.
//

import UIKit
import CoreData

class InputViewController: UIViewController {
    
    @IBOutlet weak var sentence: UITextField?
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl?
    
    var container: NSPersistentContainer!
    lazy var category: String? = {
        if typeSegmentedControl?.selectedSegmentIndex == 0 {
            return "trend"
        } else {
            return "old fashion"
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
        // The persistent container is available.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        // Returns the entity with the specified name from the managed object model associated with the specified managed object context’s persistent store coordinator.
        saveJokeInContainer()
        resetInputUIComponentes()
    }
    
    private func saveJokeInContainer() {
        guard let entity = NSEntityDescription.entity(
            forEntityName: "Joke",
            in: self.container.viewContext
        ) else {
            return
        }
        
        let joke = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
        joke.setValue(NSUUID(), forKey: "id")
        joke.setValue(sentence?.text, forKey: "body")
        joke.setValue(category, forKey: "category")
        
        do {
            try self.container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func resetInputUIComponentes() {
        sentence?.text = ""
        typeSegmentedControl?.selectedSegmentIndex = 0
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
