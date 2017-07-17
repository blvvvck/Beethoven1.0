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
    var heightOfViewScroll = 0;
    
    @IBOutlet weak var scrollUIView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollUIView.contentSize = CGSize(width: view.bounds.width, height: 1750
)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func multiplyTask1ButtonPressed(_ sender: Any) {
        multiplyTaskButtonPressed(withIdentifier: "sbPopUpMultiplyTask1", heightOfScroll: 800)
    }
    
    @IBAction func multiplyTask2ButtonPressed(_ sender: Any) {
        multiplyTaskButtonPressed(withIdentifier: "sbPopUpMultiplyTask2", heightOfScroll: 500)
    }
    

    func multiplyTaskButtonPressed(withIdentifier : String, heightOfScroll : Int) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: withIdentifier) as! MultiplyTaskPopUpViewController1
        popOverVC.heightOfScroll = heightOfScroll
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        popUpShow = true
    }
    
    
    @IBAction func returnToMenu2(_ sender: Any) {
        guard let lParent = parent else { return }
        
        lParent.dismiss(animated: true, completion: nil)
    }
}
