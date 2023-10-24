
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onAcceptButtonClick(_ sender: UIButton) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        if username == "pepe" && password == "1234" {
            loginOk()
        } else {
            error()
        }
    }
    
    func loginOk() {
        UserDefaults.standard.set(usernameTextField.text, forKey: "username")
        performSegue(withIdentifier: "toMainScreen", sender: nil)
    }
    
    func error() {
        usernameTextField.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        passwordTextField.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
}

