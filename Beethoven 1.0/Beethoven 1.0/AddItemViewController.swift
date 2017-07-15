//
//  AddItemViewController.swift
//  Beethoven 1.0
//
//  Created by BLVCK on 14.07.17.
//  Copyright © 2017 Alina. All rights reserved.
//

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item : ChecklistItem)
}

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate : AddItemViewControllerDelegate?
    
    /*@IBAction func cancel(){
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = true
        
        delegate?.addItemViewController(self, didFinishAdding: item)
        
    }*/
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = true
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) { //отвечает за то чтобы при открытии клавиатура сразу открывалась
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        if newText.length > 0 {
            doneBarButton.isEnabled = true
        } else {
            doneBarButton.isEnabled = false
        }
        
        return true
        
    }
}
