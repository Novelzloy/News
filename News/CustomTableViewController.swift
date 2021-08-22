//
//  CustomTableViewController.swift
//  News
//
//  Created by Роман on 20.08.2021.
//

import UIKit

class CustomTableViewController: UITableViewController {

    @IBAction func refreshViewControllre(_ sender: Any) {
        
        loadNews {
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

            loadNews {
                DispatchQueue.main.async{
                    self.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                }
            }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let new = news[indexPath.row]
        cell.textLabel?.text = new.title
        cell.detailTextLabel?.text = new.description

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToSecondView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondView"{
            if let indexPath = tableView.indexPathForSelectedRow{
                (segue.destination as! CustomViewController).news = news[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}
