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
    @IBOutlet weak var todaySwitch: UISwitch!
    
    let data = Dao()
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        resultsView.dataSource = self
        resultsView.delegate = self

    }

    @IBAction func searchBtnPressed(_ sender: Any) {
        
        articles = []
        
        //check if the field has text first
        if !searchField.hasText{
            Alert.showMessage(title: "Invalid Input", msg: "Please type something then try again", view: self)
            
            //This will never fail, since there is text, the code skipped the first if
        }else if searchField.text!.contains(" "){
            Alert.showMessage(title: "Invalid Input", msg: "Your keyword cant have a space, sorry :(", view: self)
        }else{
            Alert.startLoading(view: self, completion: {
                
                //post request
                self.data.getRequest(keyword: self.searchField.text!, completionHandler: {articles in
    
                    //main thread operations
                    DispatchQueue.main.async {
                        articles.forEach({ x in
                            self.doTitleChecks(article: x)
                        })
                        
                        
                        
                        self.resultsView.reloadData()
                        
                        
                        //dismiss loading
                        self.dismiss(animated: true)
                        
                        //Display alert if no results show
                        if self.articles.isEmpty {
                            Alert.showMessage(title: "Oops", msg: "No results :(", view: self)
                        }
                    }
                    
                })
                
                //Timeout for alert and dismiss after 10 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    self.dismiss(animated: true)
                }
                
            })
        }
        
    }
    
    func doTitleChecks(article: Article){
        //Check if keyword is inside title
        if article.getTitle().lowercased().contains((self.searchField.text?.lowercased())!){
            
            //Check if article is in english
            if self.searchField.text?.rangeOfCharacter(from: NSCharacterSet.init(charactersIn:"abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted) == nil{
                
                //Check if article was published today
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
                let date = dateFormatter.date(from: String(article.getPublishedAt().dropLast(10)))
                
                //incase theres an error converting the date from string
                let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                
                //Check if toggle switch for today is on before checking dates
                if !todaySwitch.isOn{
                    self.articles.append(article)
                }else{
                    if Calendar.current.isDateInToday(date ?? yesterday){
                        self.articles.append(article)
                    }
                }
                
                
            }
            
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
        cell.currentView = self
                
        return cell
        
    }
}

