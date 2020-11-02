//
//  ViewController.swift
//  Albums
//
//  Created by iMac_06 on 2020. 7. 16..
//  Copyright © 2020년 KMK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityBackgroundView: UIView!
    
    var albums: [[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityBackgroundView.layer.cornerRadius = 15
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let ip = tableView.indexPathForSelectedRow{
            tableView.deselectRow(at: ip, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if didLoadAlbums{
            print("Alredy loaded")
        }else{
            loadAlbums()
        }
        return
    }
    @IBAction func onBtnRefresh(_ sender: Any) {
        loadAlbums()
    }
    
    func returnToMain(segue: UIStoryboardSegue){
        print("returned")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailVC{
            let index = self.tableView.indexPathForSelectedRow!.row
            vc.album = self.albums[index]
        }
    }
    
    var didLoadAlbums = false
    func loadAlbums(){
        activityIndicator.startAnimating()
        activityBackgroundView.isHidden = false
        let queue = OperationQueue()
        queue.addOperation {
            let strUrl = "http://scgyong.net/thumbs/"
            let url = URL(string: strUrl)!
            guard let data = try? Data(contentsOf: url) else {
                print("Data(contentsOf:) failed")
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{
                print("Json decoding failed")
                return
            }
            guard let root = json as? [String:[[String:String]]] else{
                print("Type casting failed")
                return
            }
            guard let albums = root["albums"] else{
                print("albums key not found")
                return
            }
            print("Downloaded \(albums.count) albums")
            OperationQueue.main.addOperation {
                self.activityIndicator.stopAnimating()
                self.activityBackgroundView.isHidden = true
                self.didLoadAlbums = true
                self.albums = albums
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let album = albums[indexPath.row]
        cell.textLabel?.text = album["albumTitle"]
        cell.detailTextLabel?.text = album["artistName"]
        cell.imageView?.image = UIImage(named: "def_album")
        if let strUrl = album["image"]{
            if let image = ImageCache.image(for: strUrl){
                cell.imageView?.image = image
            }else{
                if let url = URL(string : strUrl){
                    OperationQueue().addOperation {
                        if let data = try? Data(contentsOf: url){
                            let image = UIImage(data: data)
                            if image == nil{
                                return
                            }
                            OperationQueue.main.addOperation {
                                ImageCache.set(image: image!, for: strUrl)
                                if let c2 = tableView.cellForRow(at: indexPath){
                                    c2.imageView?.image = image
                                }
                                
                            }
                        }
                    }
                }
            }
        }
        return cell
    }
}

