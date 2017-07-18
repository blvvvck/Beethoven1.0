//
//  ViewControllerMenu1.swift
//  Beethoven 1.0
//
//  Created by itisioslab on 18.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class ViewControllerMenu1: UIViewController {

    @IBOutlet weak var buttonTest2: UIButton!
    @IBOutlet weak var buttonTest1: UIButton!
    @IBOutlet weak var buttonAlphavit: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonTest1.layer.cornerRadius = 7.0
        buttonTest1.clipsToBounds = true
        
        buttonTest2.layer.cornerRadius = 7.0
        buttonTest2.clipsToBounds = true
        
        buttonAlphavit.layer.cornerRadius = 7.0
        buttonAlphavit.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
