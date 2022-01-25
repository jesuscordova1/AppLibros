import UIKit
import Foundation

class TextFieldView : UIView{
    
    var view : UIView?
    var label : UILabel?
    var textField : UITextField?
    var icon : UIImageView?
    var line : UIView?

    var titleText : String?
    var placeHolderText : String?
    var iconName : String?
    var isSecure : Bool?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(frame: CGRect, titleText: String, placeHolderText : String, iconName : String, isSecure: Bool){
        super.init(frame: frame)
        self.titleText = titleText
        self.placeHolderText = placeHolderText
        self.iconName = iconName
        self.isSecure = isSecure
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initUI(){
        
        view = UIView()
        view?.backgroundColor = .clear
        self.addSubview(view!)
        view?.addAnchorsAndSize(width: width, height: 90, left: 20, top: 0, right: 20, bottom: 0)
        
        label = UILabel()
        label?.font = .boldSystemFont(ofSize: 20)
        label?.backgroundColor = .clear
        label?.text = titleText
        view?.addSubview(label!)
        label?.addAnchorsAndSize(width: width, height: 25, left: 0, top: 0, right: 0, bottom: nil)
        
        icon = UIImageView()
        
        icon?.backgroundColor = .clear
        icon?.image = UIImage(named: iconName!)?.withTintColor(UIColor(red: 255/255, green: 69/255, blue: 123/255, alpha: 1))
        view?.addSubview(icon!)
        icon?.addAnchorsAndSize(width: 25, height: 25, left: 0, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: label)
        
        textField = UITextField()
        textField?.isSecureTextEntry = isSecure!
        textField?.backgroundColor = .clear
        textField?.placeholder = placeHolderText
        view?.addSubview(textField!)
        textField?.addAnchorsAndSize(width: nil, height: 25, left: 10, top: nil, right: 0, bottom: nil, withAnchor: .left, relativeToView: icon)
        textField?.addAnchors(left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: label)
        
        line = UIView()
        line?.backgroundColor = UIColor(red: 9/255, green: 21/255, blue: 64/255, alpha: 1)
        view?.addSubview(line!)
        line?.addAnchorsAndSize(width: width, height: 1.5, left: 0, top: 15, right: 0, bottom: nil, withAnchor: .top, relativeToView: textField)
        
      
    }
}
