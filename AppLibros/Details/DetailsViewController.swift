import UIKit

class DetailsViewController: UIViewController {

    var libroView : UIView?
    var libro : Libro?
    var shadowLeft : UIView?
    var titleLabel : UILabel?
    var authorLabel : UILabel?
    var rating : UIImageView?
    var category : UILabel?
    var descView : UIView?
    var descButton : UIButton?
    var verticalLine : UIView?
    var authorButton : UIButton?
    var descLabel : UILabel?
    
    var titleString : String?
    var authorString : String?
    var categoryString : String?
    var descriptionString : String?
    var imgString : String?
    
    var imgLibro : UIImageView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        getData()
        initUI()
    }
    
    func getData(){
        
        
    }
    
    func initUI(){

        libroView = UIView()
        libroView?.layer.cornerRadius = 0
        libroView?.backgroundColor =  UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        view.addSubview(libroView!)
        libroView?.addAnchorsAndSize(width: nil, height: 100, left: 0, top: 90, right: 0, bottom: nil)
        
        imgLibro = UIImageView()
        let url = URL(string: imgString ?? "")
            if let data = try? Data(contentsOf: url!)
            {
                imgLibro?.image = UIImage(data: data)!
            }
        view.addSubview(imgLibro!)
        imgLibro?.addAnchorsAndSize(width: 0, height: 230, left: 140, top: 20, right: 140, bottom: nil)
     
        shadowLeft = UIView()
        shadowLeft?.backgroundColor = .gray
        view.addSubview(shadowLeft!)
        shadowLeft?.addAnchorsAndSize(width: 5, height: 230, left: nil, top: 20, right: 0, bottom: nil, withAnchor: .right, relativeToView: imgLibro)
        
        titleLabel = UILabel()
        titleLabel?.text = titleString
        titleLabel?.font = .boldSystemFont(ofSize: 25)
        titleLabel?.textAlignment = .center
        view.addSubview(titleLabel!)
        titleLabel?.addAnchorsAndSize(width: nil, height: 25, left: 0, top: 10, right: 0, bottom: nil, withAnchor: .top, relativeToView: imgLibro)
        
        authorLabel = UILabel()
        authorLabel?.text = authorString
        authorLabel?.font = .systemFont(ofSize: 20)
        authorLabel?.textAlignment = .center
        view.addSubview(authorLabel!)
        authorLabel?.addAnchorsAndSize(width: nil, height: 20, left: 0, top: 10, right: 0, bottom: nil, withAnchor: .top, relativeToView: titleLabel)
        
        rating = UIImageView()
        rating?.image = UIImage(named: "rating5")
        view.addSubview(rating!)
        rating?.addAnchorsAndSize(width: nil, height: 130, left: 150, top: -40, right: 150, bottom: nil, withAnchor: .top, relativeToView: authorLabel)
        
        category = UILabel()
        category?.text = "Categoria: \(categoryString ?? "")"
        category?.font = .boldSystemFont(ofSize: 20)
        category?.backgroundColor =  UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        category?.textColor = .white
        category?.textAlignment = .center
        view.addSubview(category!)
        category?.addAnchorsAndSize(width: nil, height: 30, left: 0, top: -40, right: 0, bottom: nil, withAnchor: .top, relativeToView: rating)
        
        descView = UIView()
        descView?.isHidden = true
        descView?.backgroundColor = .white
        descView?.layer.cornerRadius = 30
        view.addSubview(descView!)
        descView?.addAnchorsAndSize(width: nil, height: 350, left: 25, top: 15, right: 25, bottom: nil, withAnchor: .top, relativeToView: category)
        
        descButton = UIButton()
        descButton?.backgroundColor = .white
        descButton?.setTitle("Descripción", for: .normal)
        descButton?.setTitleColor(.black, for: .normal)
        descButton?.titleLabel?.textAlignment = .center
        descButton?.titleLabel?.font = .boldSystemFont(ofSize: 20)
        descView?.addSubview(descButton!)
        descButton?.addAnchorsAndSize(width: 180, height: 50, left: 0, top: 0, right: nil, bottom: nil)
        
        authorButton = UIButton()
        //authorButton?.addTarget(self, action: #selector(authorTap), for: .touchUpInside)
        authorButton?.backgroundColor = .systemGray3
        authorButton?.setTitle("", for: .normal)
        authorButton?.setTitleColor(.black, for: .normal)
        authorButton?.titleLabel?.textAlignment = .center
        authorButton?.titleLabel?.font = .boldSystemFont(ofSize: 20)
        descView?.addSubview(authorButton!)
        authorButton?.addAnchorsAndSize(width: 180, height: 50, left: nil, top: 0, right: 0, bottom: nil, withAnchor: .left, relativeToView: descButton)
        
        descLabel = UILabel()
        descLabel?.font = .systemFont(ofSize: 20)
        descLabel?.adjustsFontSizeToFitWidth = true
        descLabel?.text = descriptionString
        descLabel?.numberOfLines = 0
        descView?.addSubview(descLabel!)
        descLabel?.addAnchorsAndSize(width: nil, height: nil, left: 30, top: 10, right: 30, bottom: 20, withAnchor: .top, relativeToView: descButton)
        

        
    }
    
    
    @objc func authorTap(){
      
        let vc = AuthorViewController()
        vc.libro = libro
        present(vc, animated: true, completion: nil)
        
    }

}
