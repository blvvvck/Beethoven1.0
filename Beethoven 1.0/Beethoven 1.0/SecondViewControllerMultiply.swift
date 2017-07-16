//
//  SecondViewControllerMultiply.swift
//  Beethoven 1.0
//
//  Created by itisioslab on 14.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class SecondViewControllerMultiply: UIViewController {
    
    var popUpShow = false

    @IBOutlet weak var scrollUIView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollUIView.contentSize = CGSize(width: view.bounds.width, height: 1000)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func multiplyTask1ButtonPressed(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpMultiplyTask") as! MultiplyTaskPopUpViewController1
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        popUpShow = true
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
