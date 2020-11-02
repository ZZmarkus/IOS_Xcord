//
//  DetailVC.swift
//  Day5-Album
//
//  Created by iMac_15 on 2020. 7. 16..
//  Copyright © 2020년 KPU ios app dev. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var AlbumImageView: UIImageView!
    @IBOutlet weak var AlbumTitleLabel: UILabel!
    @IBOutlet weak var ArtistNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var album: [String:String] = [:]
    
    override func viewWillAppear(_ animated: Bool) {
        AlbumTitleLabel.text = album["albumTitle"]
        ArtistNameLabel.text = album["artistName"]
        let image = ImageCache.image(for: album["image"] ?? "") ?? UIImage(named: "def_album")
        AlbumImageView.image = image
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

extension DetailVC: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let albumTitle = self.album["albumTitle"] ?? ""
        
        return albumTitle.characters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //let albumTitle = self.album["albumTitle"] ?? ""
        let text = "song \(indexPath.row + 1)"
        cell.textLabel?.text = text
        return cell
    }
}
