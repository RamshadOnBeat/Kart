//
//  LoginVC.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import UIKit

class LoginVC: BaseViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewModel()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpViewModel(){
        loginViewModel.startAnimate = {[weak self] in
            self?.activityIndicator.isHidden = false
            self?.activityIndicator.startAnimating()
        }
        
        loginViewModel.stopAnimate = {[weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
        }
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        loginViewModel.Login(withPhone: phoneTextField.text ?? ""){[weak self] status, message in
            if status{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                self?.present(vc, animated: true)
            }else{
                self?.presentAlertWithOk(title: "Error", message: message)
            }
            
        }
    }
}
