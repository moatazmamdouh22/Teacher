//
//  AboutappVC.swift
//  Indexzone
//
//  Created by MacBook on 2/21/18.
//  Copyright © 2018 Technosaab. All rights reserved.
//

import UIKit

class AboutappVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    var refreshControl : UIRefreshControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = .none
        
        tableview.reloadData()
        addRefreshControl()

        // Do any additional setup after loading the view.
    }
    func addRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.black
        refreshControl?.addTarget(self, action: #selector(refreshApi), for: .valueChanged)
        tableview.addSubview(refreshControl!)
    }
    @objc func refreshApi(){
        tableview.reloadData()
        
        refreshControl?.endRefreshing()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APPABOUT.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if APPLANGUAGE == "ar"{
            cell.textLabel?.text = APPABOUT[indexPath.row].titleAR
            cell.textLabel?.numberOfLines = 0

        }else{
            cell.textLabel?.text = APPABOUT[indexPath.row].titleEN
            cell.textLabel?.numberOfLines = 0

        }
        let myFont = UIFont(name: "Cairo-Regular", size: 18.0)
        if let myFont = myFont {
            cell.textLabel?.font = myFont
        }

        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isConnectedToNetwork() == true {
            print("Internet connection OK")

        } else {
            AlertHandler().displayMyAlertMessage(message: "InternetconnectionFAILED".localized, title: "Attention".localized, okTitle: "ok".localized, view: self)
        }

        self.navigationItem.title = "ABOUTAPP".localized
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

