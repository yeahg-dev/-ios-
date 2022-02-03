//
//  InputViewController.swift
//  iOS-AnyWordsParty
//
//  Created by 1 on 2022/02/03.
//

import UIKit
import CoreData

class InputViewController: UIViewController {
    
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
        // The persistent container is available.
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
