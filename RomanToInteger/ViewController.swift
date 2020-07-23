//
//  ViewController.swift
//  RomanToInteger
//
//  Created by Carolina Salamanca on 7/22/20.
//  Copyright © 2020 Carolina Salamanca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(romanToInt("MCMXCIV"))
    }
    
    func romanToInt(_ s: String) -> Int {
          let romanNumbers = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        var sum = 0
        var priorNumber: Int!
        
        for number in s {
            let intNumber = romanNumbers[String(number)]!

            if (priorNumber == 1 && (intNumber == 10 || intNumber == 5 )) ||
               (priorNumber == 10  && (intNumber == 50 || intNumber == 100)) ||
               (priorNumber == 100  && (intNumber == 500 || intNumber == 1000 )) {
                    sum = sum - Int(priorNumber) + (intNumber - priorNumber)
            }else{
                sum += intNumber
            }
            priorNumber = intNumber
        }
        
        return Int(sum)
    }
}

