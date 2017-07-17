//
//  TestMultiplyViewController.swift
//  Beethoven 1.0
//
//  Created by itisioslab on 14.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class TestMultiplyViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var firstNumberLable: UILabel!
    @IBOutlet weak var secondNumberLable: UILabel!
    @IBOutlet weak var answerResultMultiply: UITextField!
    @IBOutlet weak var difficultyLevelPickerView: UIPickerView!

    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    var correctAnswer : String = ""
    let levels = ["Легкий", "Средний", "Сложный"]
    var firstRandomRangeTo : UInt32 = 9
    var secondRandomRangeTo : UInt32 = 9
    var firstRandomRangeFrom : UInt32 = 1
    var secondRandomRangeFrom : UInt32 = 1
    var difficultyLevel : String = "Легкий"
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levels.count
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return levels[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard difficultyLevel != levels[row] else { return }
        difficultyLevel = levels[row]
        layerOnNextClick()
        createTask()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layerOnNextClick()
        createTask()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func checkAnswerButtonPressed(_ checkAnswerButton: UIButton) {
        if (answerResultMultiply.text == correctAnswer) {
            answerResultMultiply.layer.borderWidth = 2.5
            answerResultMultiply.layer.borderColor = UIColor.green.cgColor
        } else {
            answerResultMultiply.layer.borderWidth = 2.5
            answerResultMultiply.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    @IBAction func nextTaskButtonPressed(_ nextTaskButton: UIButton) {
        createTask()
            }
    
    func createTask() {
        
        layerOnNextClick()
        
        if (difficultyLevel == "Легкий") {
            firstRandomRangeTo = 9
            secondRandomRangeTo = 9
            firstRandomRangeFrom = 1
            secondRandomRangeFrom = 1
        }
        
        if (difficultyLevel == "Средний") {
            firstRandomRangeTo = 89
            secondRandomRangeTo = 9
            firstRandomRangeFrom = 10
            secondRandomRangeFrom = 1
        }
        
        if (difficultyLevel == "Сложный") {
            firstRandomRangeTo = 89
            secondRandomRangeTo = 89
            firstRandomRangeFrom = 10
            secondRandomRangeFrom = 10
        }
        
        let firstNumber = arc4random_uniform(firstRandomRangeTo) + firstRandomRangeFrom
        let secondNumber = arc4random_uniform(secondRandomRangeTo) + secondRandomRangeFrom
        correctAnswer = String (Int(firstNumber * secondNumber))
        firstNumberLable.text = String(firstNumber)
        secondNumberLable.text = String(secondNumber)
    }
    
    // цвет поля ввода ответа становится белым
    func layerOnNextClick() {
        answerResultMultiply.text = ""
        answerResultMultiply.layer.borderWidth = 1
        answerResultMultiply.layer.borderColor = UIColor.black.cgColor

    }
    
    @IBAction func returnToMenu4(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
