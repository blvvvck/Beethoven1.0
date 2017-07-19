//
//  ViewControllerForCollectionViewController.swift
//  Beethoven 1.0
//
//  Created by Alina on 13.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class ViewControllerForCollectionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonPastLetter: UIButton!
    @IBOutlet weak var buttonNextLetter: UIButton!
    @IBOutlet weak var labelView: UILabel!
    var indexOfCurrentChar: Int = 0
    var indexOfNextChar: Int = 0
    var indexOfPastChar: Int = 0
    
    var models: [CellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //отображение на экране
        display(with: indexOfCurrentChar, models:  models)
        
        buttonNextLetter.layer.borderWidth = 2
        buttonNextLetter.layer.borderColor = UIColor.black.cgColor
        buttonNextLetter.layer.cornerRadius = 10
        
        buttonPastLetter.layer.borderWidth = 2
        buttonPastLetter.layer.borderColor = UIColor.black.cgColor
        buttonPastLetter.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func display(with indexOfCurrentChar: Int, models: [CellData]){
        if indexOfCurrentChar != 0 && indexOfCurrentChar != 32{
            indexOfNextChar = indexOfCurrentChar + 1
            indexOfPastChar = indexOfCurrentChar - 1
        }
        if indexOfCurrentChar == 0 {
            indexOfNextChar = indexOfCurrentChar + 1
            indexOfPastChar = 32
        }
        if indexOfCurrentChar == 32 {
            indexOfNextChar = 0
            indexOfPastChar = indexOfCurrentChar - 1
        }
        let currentModel = models[indexOfCurrentChar]
        labelView.text = currentModel.cellText
        buttonNextLetter.setTitle(currentModel.cellTextNext,for: .normal)
        buttonPastLetter.setTitle(currentModel.cellTextPast, for: .normal)
        imageView.image = currentModel.cellImage
        
        labelView.sizeToFit()
        
    }
    
    @IBAction func goToNextLetter(_ sender: Any) {
        let array = models
        
        if indexOfCurrentChar != 32{
            indexOfPastChar = indexOfCurrentChar
            indexOfCurrentChar = indexOfNextChar
            indexOfNextChar = indexOfCurrentChar + 2
        
        }
        else{
            indexOfPastChar = indexOfCurrentChar
            indexOfCurrentChar = 0
            indexOfNextChar = 1
        }
        
        display(with: indexOfCurrentChar, models: array)
    }
    
    
    @IBAction func goToPastLetter(_ sender: Any) {
        let array = models
        
        if indexOfCurrentChar != 0{
            indexOfNextChar = indexOfCurrentChar
            indexOfCurrentChar = indexOfPastChar
            indexOfPastChar = indexOfPastChar - 1
        }
        else{
            indexOfNextChar = indexOfCurrentChar
            indexOfCurrentChar = indexOfPastChar
            indexOfPastChar = 32
        }
        
        display(with: indexOfCurrentChar, models: array)
        
    }
}
