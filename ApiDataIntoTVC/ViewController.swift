//
//  ViewController.swift
//  ApiDataIntoTVC
//
//  Created by Ranga Madushan on 3/29/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var herosArray = [HeroDetails]();
    //metha ekat wad gannwa eka nisai mehem danne naththn
   // var herosarra:HeroDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            self.tableView.reloadData();
            //athandi dispatch dala kara tiyenne json data download wela complte wuanin passe thami meka karnne kiyan eka
        }
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        
    }//func view did load
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return herosArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil);
        cell.textLabel?.text = herosArray[indexPath.row].localized_name.capitalized;
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self);
    }
    
    //me method eka danne segue eken apita ona data tika ywaganna thami
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? HeroViewController {
            destination.aHero = herosArray[(tableView.indexPathForSelectedRow?.row)!];
        }
        
    }
    
    
    
    

    //methan me athule completed kiyanne parameter widiyta api denwa e
    //func eka.. eka return karnneth func ekakmi.. ekai ()mewa 2k tiyenne
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.opendota.com/api/heroStats");
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.herosArray = try JSONDecoder().decode([HeroDetails].self, from: data!)
                    
                    //methan completed kyan method eka run karann ona
                    //eka thami tableview reload karnne ehmath
                    //but direct method nathuwa Dispatch.queue.async dala
                    //wade karnwa
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                    
                } catch {
                    print("JSON Error occured")
                }
            }
        } .resume()
        
    }//func downloadJSON


}//class

