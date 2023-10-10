//
//  SecondViewController.swift
//  LeeJamin-practice
//
//  Created by 이자민 on 2023/10/07.
//

import UIKit

class SecondViewController: UIViewController {
    var email: String = ""
    var password: String = ""
    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    private func bindText() {
        self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
        backButton.layer.cornerRadius = 8

    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)
        }else{
            self.dismiss(animated: false)
        }
        
        delegate?.getLoginData(email: email, password: password)
        
        guard let loginDataCompletion else {return}
                loginDataCompletion([self.email, self.password])
    }
    
}
