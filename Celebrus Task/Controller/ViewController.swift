//
//  ViewController.swift
//  Celebrus Task
//
//  Created by John Akpenyi on 10/01/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var resultsView: UITableView!
    @IBOutlet weak var searchField: UITextField!

    let data = Dao()
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        resultsView.dataSource = self
        resultsView.delegate = self
       
        print("done")
    }

    @IBAction func searchBtnPressed(_ sender: Any) {
        
        if !searchField.state.isEmpty{
            Alert.showMessage(title: "Invalid Input", msg: "Please type something then try again", view: self)
        }else{
            Alert.startLoading(view: self, completion: {
                
                self.data.getRequest(keyword: self.searchField.text!, completionHandler: {articles in
    
                    DispatchQueue.main.async {
                        articles.forEach({ x in
                            if x.getTitle().lowercased().contains((self.searchField.text?.lowercased())!){
                                self.articles.append(x)
                            }
                        })
                      
                        self.resultsView.reloadData()
                        
                        //dismiss loading
                        self.dismiss(animated: true)
                    }
                    
                    
                })
                
            })
        }
        
    }
    
}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // get a reference to the storyboard cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath as IndexPath) as! ResultsViewCell
                
        //get a reference to the label and url in the cell
        cell.titleLabel.text = articles[indexPath.row].getTitle()
        cell.url = articles[indexPath.row].getUrl()
                
        return cell
        
    }
}

