//
//  MultiplyTaskPopUpViewController1.swift
//  Beethoven 1.0
//
//  Created by Дамир Зарипов on 16.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class MultiplyTaskPopUpViewController1: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var heightOfScroll : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        scrollView.contentSize = CGSize(width: 200, height: heightOfScroll)
        changeScrollState(with: false)
    }
    

    @IBAction func closeTaskPopUp(_ sender: Any) {
        (parent as! SecondViewControllerMultiply).popUpShow = false
        self.removeAnimate()
        self.view.removeFromSuperview()
        changeScrollState(with: true)
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    private func changeScrollState(with bool: Bool) {
        let multiplyController = parent as! SecondViewControllerMultiply
        let rootController = multiplyController.parent as! RootViewController
        let scrollView = rootController.view.subviews[0] as! UIScrollView
        
        scrollView.isScrollEnabled = bool
    }
    

}
