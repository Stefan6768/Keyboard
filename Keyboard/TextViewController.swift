//
//  ViewController.swift
//  Keyboard
//
//  Created by Stefan Schreiber on 23.11.22.
//

import UIKit

class TextViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var surname: UITextField!
    
    @IBOutlet weak var text: UITextView!
    
    
    @IBOutlet weak var telefon: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstname.delegate = self
        surname.delegate = self
        telefon.keyboardType = .numbersAndPunctuation
        self.dismissKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardA), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardB), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        text.inputAccessoryView = createToolbar()
        
    }
    
    @objc func keyboardA(notification: NSNotification){
        if self.view.frame.origin.y == 0 && (telefon.isFirstResponder){
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
            
        }
    
    @objc func keyboardB(notification: NSNotification){
        if self.view.frame.origin.y == 0 && (telefon.isFirstResponder){
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
        
        func textFieldShouldReturn( _textField: UITextField) -> Bool {
            view.endEditing(true)
            return true
        }
        
        @objc func outsideKeyboard(){
            view.endEditing(true)
        }
        
        func dismissKeyboard() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(outsideKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
            
        }
    
    @objc func entfernen(){
        text.text = ""
    }
    
    @objc func donePressed(){
        text.endEditing(true)
    }
    
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let trash = UIBarButtonItem(barButtonSystemItem: .trash, target: nil, action: #selector(entfernen))
        toolbar.setItems([doneButton, trash], animated: true)
        
        return toolbar
        
    }
        
    }
    


