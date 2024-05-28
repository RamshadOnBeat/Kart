//
//  UIViewController+extension.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation
import UIKit
extension UIViewController{

    func presentAlertWithOk(title: String, message: String){
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
}
