//
//  ViewControllerForTest2.swift
//  Beethoven 1.0
//
//  Created by Alina on 17.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit


class ViewControllerForTest2: UIViewController {

    
    @IBOutlet weak var image1Test2: UIImageView!
    @IBOutlet weak var image2Test2: UIImageView!
    @IBOutlet weak var image3Test2: UIImageView!
    
    
    @IBOutlet weak var labelTest2: UILabel!
    
    var alphabet3:[String] = ["А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я"]
    var countImage3 = 0
    var randomNumber2 = 0
    var numberOfImage2 = ""
    var arrayImage:[UIImage] = [UIImage(),UIImage(),UIImage()]
    var flag = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        drawViewControllerForTest2()

        // Do any additional setup after loading the view.
    }

    
    func drawViewControllerForTest2() {
        randomImageForTest2()
        randomImageForTest3()
    } 

    

    func randomImageForTest2() {
        randomNumber2 = Int(arc4random_uniform(33))
        numberOfImage2 = String(randomNumber2)
        
        arrayImage[0] = UIImage(named: numberOfImage2)!
        
        for i in 1..<3 {
            arrayImage[i] = UIImage(named: (String)(arc4random_uniform(33)))!
            if arrayImage[0] == arrayImage[i] || arrayImage[i-1] == arrayImage[i]  {
                if arrayImage[i] == UIImage(named: "32") {
                    arrayImage[i] = UIImage(named: "19")!
                }
                else{
                    arrayImage[i] = UIImage(named: (String)(randomNumber2 + 1))!
                }
            }
        }
        labelTest2.text = alphabet3[randomNumber2]
    }
    
    func randomImageForTest3() {
        if flag%2 == 0 || flag%3 == 0 {
            if flag%2 == 0 {
                image1Test2.image = arrayImage[2]
                image2Test2.image = arrayImage[0]
                image3Test2.image = arrayImage[1]
                flag+=1
            }
            if flag%3 == 0 {
                image1Test2.image = arrayImage[0]
                image2Test2.image = arrayImage[2]
                image3Test2.image = arrayImage[1]
                flag+=1
            }
        }
        else{
            image1Test2.image = arrayImage[2]
            image2Test2.image = arrayImage[1]
            image3Test2.image = arrayImage[0]
            flag+=1
        }
        
        let touch1 = UITapGestureRecognizer(target: self, action: #selector(action1(sender:)))
        let touch2 = UITapGestureRecognizer(target: self, action: #selector(action1(sender:)))
        let touch3 = UITapGestureRecognizer(target: self, action: #selector(action1(sender:)))
        
        image1Test2.addGestureRecognizer(touch1)
        image2Test2.addGestureRecognizer(touch2)
        image3Test2.addGestureRecognizer(touch3)
    }
    
 
    func action1(sender: UITapGestureRecognizer) {
        let currentImageView = sender.view as! UIImageView
        if currentImageView.image == arrayImage[0]{
            drawViewControllerForTest2()
            image1Test2.layer.borderWidth = 0.0
            image2Test2.layer.borderWidth = 0.0
            image3Test2.layer.borderWidth = 0.0
        }
        else{
        currentImageView.layer.borderWidth = 1.0
        currentImageView.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    


}
