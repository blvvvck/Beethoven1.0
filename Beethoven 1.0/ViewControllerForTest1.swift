//
//  ViewControllerForTest1.swift
//  Beethoven 1.0
//
//  Created by Alina on 14.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit
struct CellData2 {
    var cellText2: String
    var cellImage2: UIImage
    var cellTextNext2:String
    var cellTextPast2:String
    
    init(text: String, image: UIImage, textNext:String, textPast:String) {
        cellText2 = text
        cellImage2 = image
        cellTextNext2 = textNext
        cellTextPast2 = textPast
    }
}

class ViewControllerForTest1: UIViewController {
    
    var alphabet2:[String] = ["А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я"]
    var cellDataArray2:[CellData2] = []
    var countImage2 = 0
    
    
    @IBOutlet weak var testButton1: UIButton!
    @IBOutlet weak var testButton2: UIButton!
    @IBOutlet weak var testButton3: UIButton!
    
    
    @IBOutlet weak var testImage: UIImageView!
    
    var randomNumber = 0
    var numberOfImage = ""
    var arrayLetters:[String] = [ "", "", ""]
    var flag = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0..<33 {
            var cellData: CellData2!
            
            if ( i != 32)&&(i != 0){
                cellData = CellData2(text:"\(alphabet2[i])" , image: UIImage(named: "\(countImage2)")!, textNext: "\(alphabet2[i+1]) >",textPast: "< \(alphabet2[i-1])")
            }
            if i == 32 {
                cellData = CellData2(text:"\(alphabet2[i])" , image: UIImage(named: "\(countImage2)")!, textNext: "\(alphabet2[0]) >", textPast: "< \(alphabet2[i-1])")
            }
            if i == 0{
                cellData = CellData2(text:"\(alphabet2[i])" , image: UIImage(named: "\(countImage2)")!, textNext: "\(alphabet2[1]) >", textPast: "< \(alphabet2[32])")
                
            }
            cellDataArray2.append(cellData)
        }
        drawViewController()
        
        
        // Do any additional setup after loading the view.
    }
    func drawViewController() {
        randomImage()
        testImage.image = UIImage(named: numberOfImage)
        randomButton()
    }
    func randomImage() {
        randomNumber = Int(arc4random_uniform(33))
        numberOfImage = String(randomNumber)
        
        arrayLetters[0] = alphabet2[randomNumber]
        
        for i in 1..<3 {
            arrayLetters[i] = alphabet2[Int(arc4random_uniform(UInt32(alphabet2.count)))]
            if arrayLetters[0] == arrayLetters[i] || arrayLetters[i-1] == arrayLetters[i]  {
                if arrayLetters[i] == "Я"{
                    arrayLetters[i] = "Р"
                }
                if arrayLetters[i] != "Я" {
                    arrayLetters[i] = alphabet2[randomNumber + 1]
                }
            }
        }
    }
    
    func randomButton() {
        if flag%2 == 0 || flag%3 == 0 {
            if flag%2 == 0 {
                testButton1.setTitle(arrayLetters[0],for: .normal)
                testButton2.setTitle(arrayLetters[1],for: .normal)
                testButton3.setTitle(arrayLetters[2],for: .normal)
                flag+=1
            }
            if flag%3 == 0 {
                testButton1.setTitle(arrayLetters[1],for: .normal)
                testButton2.setTitle(arrayLetters[0],for: .normal)
                testButton3.setTitle(arrayLetters[2],for: .normal)
                flag+=1
            }
        }
        else{
            testButton1.setTitle(arrayLetters[1],for: .normal)
            testButton2.setTitle(arrayLetters[2],for: .normal)
            testButton3.setTitle(arrayLetters[0],for: .normal)
            flag+=1
        }
    }
    
    

    @IBAction func actionButtonsForTest(_ sender: UIButton) {
        
        if sender.titleLabel?.text == arrayLetters[0]{
        drawViewController()
        }
        else{
            sender.setTitle("Не верно", for: .normal)
        }
        
    }
    

}
