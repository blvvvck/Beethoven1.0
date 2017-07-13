//
//  SeconViewControllerInMultiply.swift
//  Beethoven 1.0
//
//  Created by BLVCK on 13.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class SeconViewControllerInMultiply: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var TextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        
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
