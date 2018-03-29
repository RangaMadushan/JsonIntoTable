//
//  HeroViewController.swift
//  ApiDataIntoTVC
//
//  Created by Ranga Madushan on 3/29/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var attributeLable: UILabel!
    
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var legsLabel: UILabel!
    
    var aHero:HeroDetails?;
    //methan me thani ekak ne ganne ekai..hero details () mehm dala naththe
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = aHero?.localized_name;
        attributeLable.text = aHero?.primary_attr;
        attackLabel.text = aHero?.attack_type;
        legsLabel.text = "\((aHero?.legs)!)";
        
        //json eken image eke link eka dunnata base url eka na..
        //so base url eka wenam amunal ywann ona
        
        let baseUrl = "https://api.opendota.com";
        let postUrl = aHero?.img;
        let fullUrl = baseUrl + postUrl!;
        let FinalURL = URL(string: fullUrl);
        
        imageView.downloadedFrom(url: FinalURL!)
        
    }//func viewDidLoad


 

}//class
