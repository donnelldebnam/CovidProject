//
//  ViewController.swift
//  CovidProject
//
//  Created by Donnell Debnam on 4/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let users = [
        User(username: "siloh117", password: "aL,189"),
        User(username: "jordy09", password: "Pn76Ba.."),
        User(username: "kramer54", password: "09jsuW"),
        User(username: "stepht633", password: "6jGFba"),
        User(username: "les905", password: "G67ag."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Authenticate(username: usernameTextField.text!, password: passwordTextField.text!)
    }

    func Authenticate(username: String, password: String) {
        for user in users {
            if user.username == username && user.password == password {
                return;
            }
        }
        Alert(title: "Invalid Credentials", message: "We could not find an account with that username and password combination. Please try again.")
    }
    
    func Alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil) } ))
        print("alert dismissed!")
        self.present(alert, animated: true, completion: nil)
    }
    
}

