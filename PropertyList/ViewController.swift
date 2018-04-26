//
//  ViewController.swift
//  PropertyList
//
//  Created by Steven Lipton on 4/24/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct backgroundSettings:Codable{
        var image:String
        var color:Int
    }
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let decoder = PropertyListDecoder()
        let url = Bundle.main.url(forResource: "Backgrounds", withExtension: "plist")!
        if let data = try? Data(contentsOf: url){
            if let settings = try? decoder.decode(backgroundSettings.self, from: data){
                let colorName = String(format:"Color %i",settings.color)
                view.backgroundColor = UIColor(named: colorName)
                backgroundImage.image = UIImage(named: settings.image)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}





