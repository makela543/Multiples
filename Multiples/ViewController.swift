//
//  ViewController.swift
//  Multiples
//
//  Created by Mark Laukkanen on 12/03/16.
//  Copyright © 2016 Mark Laukkanen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Viewcontroller method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.whichMultiplePrompt.delegate = self;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    //Properties
    let maxNum: Int = 1000
    var currentNum: Int = 0
    var selectedMultiple = 0
    var newNum: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var whichMultiplePrompt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var labelTxt: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    
    //Actions
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        if whichMultiplePrompt.text != nil && whichMultiplePrompt.text != "" {
            startGame()
            selectedMultiple = Int(whichMultiplePrompt.text!)!
        }
    }
    
    @IBAction func onAddBtnPressed(sender: UIButton!) {
        currentNum = newNum
        newNum = currentNum + selectedMultiple
        labelTxt.text = "\(currentNum) + \(selectedMultiple) = \(newNum)"
        
        if isGameOver() {
            restartGame()
        }
    }
    
    
    //Methods
    func startGame() {
        logoImg.hidden = true
        whichMultiplePrompt.hidden = true
        playBtn.hidden = true
        
        labelTxt.hidden = false
        addBtn.hidden = false
    }
    
    func restartGame() {
        logoImg.hidden = false
        whichMultiplePrompt.hidden = false
        playBtn.hidden = false
        
        labelTxt.hidden = true
        addBtn.hidden = true
    }
    
    func isGameOver() -> Bool {
        if newNum >= maxNum {
            return true
        } else {
            return false
        }
        
    }

}

