//
//  TestMultiplyViewController.swift
//  Beethoven 1.0
//
//  Created by itisioslab on 14.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

import UIKit

class TestMultiplyViewController: UIViewController {

    @IBOutlet weak var firstNumberLable: UILabel!
    @IBOutlet weak var secondNumberLable: UILabel!
    var correctAnswer : String = ""
    @IBOutlet weak var answerResultMultiply: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTask()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func checkAnswerButtonPressed(_ checkAnswerButton: UIButton) {
        if (answerResultMultiply.text == correctAnswer) {
            answerResultMultiply.layer.borderWidth = 1.0
            answerResultMultiply.layer.borderColor = UIColor.green.cgColor
        } else {
            answerResultMultiply.layer.borderWidth = 1.0
            answerResultMultiply.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    @IBAction func nextTaskButtonPressed(_ nextTaskButton: UIButton) {
        createTask()
        
    }
    
    func createTask() {
        let firstNumber = arc4random_uniform(9) + 1
        let secondNumber = arc4random_uniform(9) + 1
        correctAnswer = String (Int(firstNumber * secondNumber))
        firstNumberLable.text = String(firstNumber)
        secondNumberLable.text = String(secondNumber)
    }

    
    

//    @IBOutlet weak var regeistraionButton: UIButton!
//    @IBOutlet weak var loginTF: UITextField!
//    @IBOutlet weak var passwordTF: UITextField!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    func checkFields() -> Bool {
//        var isFieldsCorrect = false
//        
//        if loginTF.text == "Damir" && passwordTF.text == "qwerty"  {
//            isFieldsCorrect = true
//        }
//        
//        return isFieldsCorrect
//    }
//    
//    
//    @IBAction func loginButtonPressed(_ loginButton: UIButton) {
//        
//        let isOkay = checkFields()
//        
//        if isOkay == true {
//            loginButton.setTitle("Ok", for: .normal)
//            performSegue(withIdentifier: "join", sender: nil)
//        }
//        
//        loginButton.setTitle("Error", for: .normal)
//    }

}
