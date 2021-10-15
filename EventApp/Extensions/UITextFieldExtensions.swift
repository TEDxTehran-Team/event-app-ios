//
//  UITextFieldExtensions.swift
//  EventApp
//
//  Created by Ahmadreza on 10/15/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import UIKit

extension UITextField {
    
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
       self.resignFirstResponder()
    }
}
