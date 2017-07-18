//
//  MainMultiplyViewController.swift
//  Beethoven 1.0
//
//  Created by itisioslab on 18.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class MainMultiplyViewController: UIViewController {

    @IBOutlet weak var multButton: UIButton!
    @IBOutlet weak var testMultButton: UIButton!

    
    override func viewDidLoad() {
        multButton.layer.cornerRadius = 7.0
        multButton.clipsToBounds = true
        
        testMultButton.layer.cornerRadius = 7.0
        testMultButton.clipsToBounds = true
        
        viewDidAppear(animated: true)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func viewDidAppear(animated: Bool) {
        
        let navigationBar = self.navigationController?.navigationBar
        //navigationBar?.barTintColor = UIColor.darkGray
        //navigationBar?.tintColor = UIColor.darkGray
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
