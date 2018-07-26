//
//  ViewController.swift
//  list1
//
//  Created by nic on 31/1/2017.
//  Copyright © 2017 nicksdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var quickTableView: UITableView!
    var object = ["yoo", "we", "gone", "make", "it"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        quickTableView.dataSource = self
        quickTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = self.quickTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = object[indexPath.row]
        return(cell)!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }


}

