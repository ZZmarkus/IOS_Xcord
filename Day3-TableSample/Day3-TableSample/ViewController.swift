//
//  ViewController.swift
//  Day3-TableSample
//
//  Created by iMac_15 on 2020. 7. 15..
//  Copyright © 2020년 KPU ios app dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return Nations.contintents.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let continent = Nations.contintents[section].countries
        return continent.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let continent = Nations.contintents[section]
        return continent.region
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let continent = Nations.contintents[indexPath.section]
        let country = continent.countries[indexPath.row]

        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = "(\(indexPath.section), \(indexPath.row))"
        cell.imageView?.image = UIImage(named: country.file)
        
        return cell
    }
}

