//
//  SearchViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 10.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var MovieTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieTable.delegate = self
        MovieTable.dataSource = self
    }
    

    

}
extension SearchViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.MovieTitle!.text = "It Works"
        return cell
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

   
}
    

