import UIKit

class ViewController: UIViewController {

    var topView : UIView?
    var topImage : UIImageView?
    var topIcon : UIImageView?
    var topText : UILabel?
    var fieldView : UIView?
    var loginButton : UIButton?
    var signInButton : UIButton?
    
    var emailView : TextFieldView?
    var passView : TextFieldView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 255/255, alpha: 1)
    
    let nytUrl = "https://api.nytimes.com/svc/books/v3/lists/health.json?api-key=wj99ThkWtkfF7JL4CGBixEjVyYuYK76N"
    var bookManager = BookManager(rank:0)

    override func viewDidLoad() {
        initUI()
        super.viewDidLoad()
        view.backgroundColor = .white
        bookManager.request(urlString: nytUrl)
    }

    func initUI(){
        /*topImage = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/4))
        topImage?.image = UIImage(named: "books")
        view.addSubview(topImage!)*/
        
        topView = UIView()
        topView?.layer.cornerRadius = 0
        topView?.backgroundColor = UIColor(red: 9/255, green: 21/255, blue: 100/255, alpha: 1)
        view.addSubview(topView!)
        topView?.addAnchorsAndSize(width: nil, height: 520, left: 0, top: -200, right: 0, bottom: nil)
        
        topIcon = UIImageView()
        topIcon?.image = UIImage(named: "i")
        view.addSubview(topIcon!)
        topIcon?.addAnchorsAndSize(width: nil, height: 100, left: 150, top: 100, right: 150, bottom: nil)
        
        fieldView = UIView()
        fieldView?.backgroundColor = .white
        view.addSubview(fieldView!)
        fieldView?.addAnchorsAndSize(width: nil, height: 225, left: 0, top: 20, right: 0, bottom: nil, withAnchor: .top, relativeToView: topView)
        
        topText = UILabel()
        topText?.text = "¡Bienvenido!"
        topText?.textAlignment = .center
        topText?.textColor = .white
        topText?.font = .boldSystemFont(ofSize: 40)
        view.addSubview(topText!)
        topText?.addAnchorsAndSize(width: nil, height: 50, left: 25, top: 20, right: 25, bottom: nil, withAnchor: .top, relativeToView: topIcon)
        
        emailView = TextFieldView(frame:CGRect(), titleText: "Correo", placeHolderText: "Ingrese su correo electrónico", iconName: "u", isSecure: false)
        emailView?.textField?.text = "jesus@gmail.com"
        fieldView?.addSubview(emailView!)
        emailView?.addAnchors(left: 0, top: 15, right: 0, bottom: nil)
        
        passView = TextFieldView(frame: CGRect(), titleText: "Contraseña", placeHolderText: "Ingrese su contraseña", iconName: "p", isSecure: true)
        passView?.textField?.text = "lol"
        fieldView?.addSubview(passView!)
        passView?.addAnchors(left: 0, top: 20, right: 0, bottom: nil, withAnchor: .top, relativeToView: emailView)
        
        loginButton = UIButton()
        loginButton?.layer.cornerRadius = 15
        loginButton?.setTitle("INICIAR SESIÓN", for: .normal)
        loginButton?.backgroundColor = UIColor(red: 9/255, green: 21/255, blue: 100/255, alpha: 1)
        loginButton?.setTitleColor(UIColor.white, for: .normal)
        loginButton?.addTarget(self, action: #selector(loginTap), for: .touchUpInside)
        view.addSubview(loginButton!)
        loginButton?.addAnchorsAndSize(width: width, height: 60, left: 30, top: 30, right: 30, bottom: nil, withAnchor: .top, relativeToView: passView)
        
        signInButton = UIButton()
        signInButton?.titleLabel?.font = .boldSystemFont(ofSize: 18)
        signInButton?.setTitle("¿No tienes cuenta? ¡Regístrate!", for: .normal)
        signInButton?.setTitleColor(UIColor(red: 255/255, green: 69/255, blue: 123/255, alpha: 1), for: .normal)
        signInButton?.addTarget(self, action: #selector(signInTap), for: .touchUpInside)
        view.addSubview(signInButton!)
        signInButton?.addAnchorsAndSize(width: width, height: 60, left: 30, top: -10, right: 30, bottom: nil, withAnchor: .top, relativeToView: loginButton)
        
    }

    @objc func loginTap(){
        let HomeVC = HomeViewController()
        HomeVC.modalPresentationStyle = .fullScreen
        let emailText = emailView?.textField?.text
        let passText = passView?.textField?.text
        
        
        if (emailText!.isEmpty || passText!.isEmpty){
            let alert = UIAlertController(title: "Error", message: "No deje ningún campo vacío", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else if emailText!.isValidEmail(){
            present(HomeVC, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Error", message: "Ingrese un correo electrónico válido", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    
        
    }
    
    @objc func signInTap(){
        let signInVC = SignUpViewController()
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true, completion: nil)
    }
}


