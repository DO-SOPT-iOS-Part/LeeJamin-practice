//
//  ViewController.swift
//  LeeJamin-practice
//
//  Created by 이자민 on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    private var idText: String = ""
    private var passwordText: String = ""

    @IBOutlet weak var idTextFieldDidEditing: UITextField!
    @IBOutlet weak var passwordTextFieldDidEditing: UITextField!
    @IBOutlet weak var passwordLookButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
    }


    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
                if let idText = textField.text {
                    self.idText = idText
                }
    }
    

    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    @IBAction func passwordLookButtonTap(_ sender: Any) {
        
        passwordTextFieldDidEditing.isSecureTextEntry.toggle()
        passwordLookButton.isSelected.toggle()
        if passwordLookButton.isSelected{
            passwordLookButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }
        else {
            passwordLookButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    @IBAction func loginButtonTap(_ sender: UIButton) {
    
        print("\(idText)\n\(passwordText)")
        pushToSecondViewController()
    }
    
    
    func pushToSecondViewController() {
        guard let SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
            
        SecondViewController.email = idText
        SecondViewController.password = passwordText
        
        SecondViewController.delegate = self
        
        
        
        //self.present(SecondViewController,animated: true)
        self.navigationController?.pushViewController(SecondViewController, animated: true)
        
        SecondViewController.loginDataCompletion = { data in
                    print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
                }
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
