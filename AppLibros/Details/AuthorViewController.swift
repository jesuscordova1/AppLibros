
import UIKit

class AuthorViewController: UIViewController {
    
    var libro : Libro?
    
    var masterView : UIView?
    var authorImage : UIImageView?
    var authorLabel : UILabel?
    var descriptionLabel : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = /*.systemGray5*/UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        initUI()
    }
    
    func initUI(){
        
        masterView = UIView()
        masterView?.layer.cornerRadius = 10
        masterView?.backgroundColor = .white
        view.addSubview(masterView!)
        masterView?.addAnchorsAndSize(width: nil, height: 350, left: 35, top: 150, right: 35, bottom: nil)
        
        authorImage = UIImageView()
        authorImage?.image = UIImage(named: libro?.imgAuthorName ?? "")
        authorImage?.backgroundColor = .red
        authorImage?.layer.cornerRadius = 10
        authorImage?.layer.borderColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        authorImage?.layer.borderWidth = 7
        authorImage?.layer.masksToBounds = true
        masterView?.addSubview(authorImage!)
        authorImage?.addAnchorsAndSize(width: nil, height: 200, left: 100, top: -120, right: 100, bottom: nil)
        
        authorLabel = UILabel()
        authorLabel?.text = libro?.author
        authorLabel?.font = .boldSystemFont(ofSize: 35)
        authorLabel?.textColor = UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        authorLabel?.textAlignment = .center
        masterView?.addSubview(authorLabel!)
        authorLabel?.addAnchorsAndSize(width: nil, height: 50, left: 0, top: 10, right: 0, bottom: nil, withAnchor: .top, relativeToView: authorImage)
        
        descriptionLabel = UILabel()
        descriptionLabel?.textAlignment = .center
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.text = libro?.descAuthor
        descriptionLabel?.adjustsFontSizeToFitWidth = true
        masterView?.addSubview(descriptionLabel!)
        descriptionLabel?.addAnchorsAndSize(width: nil, height: nil, left: 25, top: 0, right: 25, bottom: 25, withAnchor: .top, relativeToView: authorLabel)
        
        
    }


}
