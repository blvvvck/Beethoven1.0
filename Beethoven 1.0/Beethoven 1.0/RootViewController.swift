//
//  RootViewController.swift
//  Beethoven 1.0
//
//  Created by BLVCK on 12.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class RootViewController: UIPageViewController, UIPageViewControllerDataSource {
    var currentIndex: Int = 0

    var viewControllerList: [UIViewController] = {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "GreenVC")
        
        let vc2 = sb.instantiateViewController(withIdentifier: "YellowVC")
        
        return [vc1, vc2]
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.dataSource = self
        
        let firstViewController = viewControllerList[currentIndex]
        
        self.setViewControllers([firstViewController ], direction: .forward, animated: true, completion: nil)
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else { return nil }
        
        guard viewControllerList.count > nextIndex else {return nil}
        
        return viewControllerList[nextIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        
        guard viewControllerList.count > previousIndex else {return nil}
        
        return viewControllerList[previousIndex]
    }
    
    
    
}
