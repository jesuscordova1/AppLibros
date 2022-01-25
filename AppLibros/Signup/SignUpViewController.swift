import UIKit

class SignUpViewController: UIViewController {

    var dismissButton : UIButton?
    var topLabel : UILabel?
    var masterView : UIView?
    var titleLabel : UILabel?
    var signUpButton : UIButton?
    
    var userTextFieldView : TextFieldView?
    var emailTextFieldView : TextFieldView?
    var passTextFieldView : TextFieldView?
    var confirmTextFieldView : TextFieldView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        initUI()
    }
    
    func initUI(){
        dismissButton = UIButton(frame: CGRect(x: 15, y: 50, width: 40, height: 40))
        dismissButton?.addTarget(self, action: #selector(dismissSignUp), for: .touchUpInside)
        dismissButton?.setImage(UIImage(named: "back"), for: .normal)
        view.addSubview(dismissButton!)
        
        topLabel = UILabel()
        topLabel?.numberOfLines = 0
        topLabel?.text = "¡Prepárate para la mejor experiencia de biblioteca posible!"
        topLabel?.textAlignment = .center
        topLabel?.font = .boldSystemFont(ofSize: 20)
        topLabel?.textColor = UIColor(red: 255/255, green: 69/255, blue: 123/255, alpha: 1)
        view.addSubview(topLabel!)
        topLabel?.addAnchorsAndSize(width: nil, height: 60, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: dismissButton)
        
        masterView = UIView()
        masterView?.layer.cornerRadius = 20
        masterView?.backgroundColor = .white
        view.addSubview(masterView!)
        masterView?.addAnchorsAndSize(width: nil, height: 510, left: 25, top: 15, right: 25, bottom: nil, withAnchor: .top, relativeToView: topLabel)
        
        titleLabel = UILabel()
        titleLabel?.text = "Registre sus datos"
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = UIColor(red: 9/255, green: 21/255, blue: 100/255, alpha: 1)
        titleLabel?.font = .boldSystemFont(ofSize: 30)
        titleLabel?.backgroundColor = .clear
        masterView?.addSubview(titleLabel!)
        titleLabel?.addAnchorsAndSize(width: nil, height: 60, left: 20, top: 15, right: 20, bottom: nil)
        
        userTextFieldView = TextFieldView(frame: CGRect(), titleText: "Usuario", placeHolderText: "Ingrese un nuevo nombre de usuario", iconName: "u", isSecure: false)
        masterView?.addSubview(userTextFieldView!)
        userTextFieldView?.addAnchors(left: 5, top: 10, right: 5, bottom: nil, withAnchor: .top, relativeToView: titleLabel)
        
        emailTextFieldView = TextFieldView(frame: CGRect(), titleText: "Correo", placeHolderText: "Ingrese su correo electrónico", iconName: "correo", isSecure: false)
        masterView?.addSubview(emailTextFieldView!)
        emailTextFieldView?.addAnchors(left: 5, top: 15, right: 5, bottom: nil, withAnchor: .top, relativeToView: userTextFieldView)
        
        passTextFieldView = TextFieldView(frame: CGRect(), titleText: "Contraseña", placeHolderText: "Ingrese su contraseña", iconName: "p", isSecure: true)
        masterView?.addSubview(passTextFieldView!)
        passTextFieldView?.addAnchors(left: 5, top: 15, right: 5, bottom: nil, withAnchor: .top, relativeToView: emailTextFieldView)
        
        confirmTextFieldView = TextFieldView(frame: CGRect(), titleText: "Confirmar contraseña", placeHolderText: "Confirme su contraseña", iconName: "p", isSecure: true)
        masterView?.addSubview(confirmTextFieldView!)
        confirmTextFieldView?.addAnchors(left: 5, top: 15, right: 5, bottom: nil, withAnchor: .top, relativeToView: passTextFieldView)
        
        signUpButton = UIButton()
        signUpButton?.addTarget(self, action: #selector(signUpTap), for: .touchUpInside)
        signUpButton?.layer.cornerRadius = 15
        signUpButton?.setTitle("CREAR CUENTA", for: .normal)
        signUpButton?.backgroundColor = UIColor(red: 9/255, green: 21/255, blue: 100/255, alpha: 1)
        signUpButton?.setTitleColor(UIColor.white, for: .normal)
        //signUpButton?.addTarget(self, action: #selector(loginTap), for: .touchUpInside)
        view.addSubview(signUpButton!)
        signUpButton?.addAnchorsAndSize(width: width, height: 45, left: 40, top: 30, right: 40, bottom: nil, withAnchor: .top, relativeToView: masterView)
    }
    
    @objc func dismissSignUp(){
        dismiss(animated: true)
    }

    @objc func signUpTap(){
        let alertEmpty = UIAlertController(title: "Error", message: "No deje ningún campo vacío", preferredStyle: .alert)
        alertEmpty.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        let alertEqual = UIAlertController(title: "Error", message: "La contraseña tiene que ser igual a la confirmación", preferredStyle: .alert)
        alertEqual.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        let alertEmail = UIAlertController(title: "Error", message: "El correo está en un formato incorrecto", preferredStyle: .alert)
        alertEmail.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        let userText = userTextFieldView?.textField?.text
        let emailText = emailTextFieldView?.textField?.text
        let passText = passTextFieldView?.textField?.text
        let confirmText = confirmTextFieldView?.textField?.text
        
        var isEmpty : Bool = false
        var isNotEqual : Bool = false
        var emailValid = false
        
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        
        if userText!.isEmpty || emailText!.isEmpty || passText!.isEmpty || confirmText!.isEmpty {
            self.present(alertEmpty, animated: true, completion: nil)
            isEmpty = true
        }
        
        if passText != confirmText {
            self.present(alertEqual, animated: true, completion: nil)
            isNotEqual = true
        }
        
        if emailText!.isValidEmail(){
            emailValid = true
        }else{
            self.present(alertEmail, animated: true, completion: nil)
        }
        
        if isNotEqual == false && isEmpty == false && emailValid{
            present(vc, animated: true, completion: nil)

        }
        
        
        
    }
}

extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
