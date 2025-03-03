//
//  AnyWordsPartyTableViewController.swift
//  iOS-AnyWordsParty
//
//  Created by 1 on 2022/02/03.
//

import UIKit
import CoreData

protocol Fetchable: AnyObject {
    func fetchJokes()
}

class AnyWordsPartyTableViewController: UITableViewController {
    
    var container: NSPersistentContainer!
    private var jokes: [Joke] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
        fetchJokes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? InputViewController {
            nextViewController.fetchDeleage = self as Fetchable
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = jokes[safe: indexPath.row]?.body
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let identifier = jokes[indexPath.row].id
            deleteCoreDataObject(of: identifier!)
            jokes.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    private func deleteCoreDataObject(of identifier: UUID) {
        do {
            let joke = try self.container.viewContext.fetch(Joke.fetchRequest(of: identifier))
            // TODO: 객체 1개만 fetch해오도록 리팩터링
            container.viewContext.delete(joke[0])
        } catch {
            print(error.localizedDescription)
        }
        
        do {
            try self.container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension AnyWordsPartyTableViewController: Fetchable {
    
    func fetchJokes() {
        do {
            let jokes = try self.container.viewContext.fetch(Joke.fetchRequest())
            self.jokes = jokes
        } catch {
            print(error.localizedDescription)
        }
        // TODO: 호출 위치 이동
        tableView.reloadData()
    }
}

