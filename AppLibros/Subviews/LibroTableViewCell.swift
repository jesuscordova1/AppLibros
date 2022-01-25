import UIKit
import Foundation

class LibroTableViewCell : UITableViewCell{
    
    var libro : Libro?
    var masterView : UIView?
    var icon : UIImageView?
    var titleLabel : UILabel?
    var authorLabel : UILabel?
    var categoryLabel : UILabel?
    var starIcon : UIImageView?
    var ratingNumber : UILabel?
    var line : UIView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(libro : Libro){
        super.init(style: .default, reuseIdentifier: nil)
        self.libro = libro
        initUI()
    }
    
    func initUI(){
        
        masterView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 150))
        masterView?.backgroundColor = .white
        self.addSubview(masterView!)
        
        icon = UIImageView()
        icon?.image = UIImage(named: libro?.imgName ?? "")
        masterView?.addSubview(icon!)
        icon?.addAnchorsAndSize(width: 70, height: 110	, left: 20, top: 20, right: nil, bottom: nil)
        
        titleLabel = UILabel()
        titleLabel?.textColor = UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        titleLabel?.font = .boldSystemFont(ofSize: 23)
        titleLabel?.text = libro?.title
        masterView?.addSubview(titleLabel!)
        titleLabel?.addAnchorsAndSize(width: width, height: 25, left: 15, top: 20, right: nil, bottom: nil, withAnchor: .left, relativeToView: icon)
       
        authorLabel = UILabel()
        authorLabel?.textColor = .gray
        authorLabel?.font = .systemFont(ofSize: 20)
        authorLabel?.text = libro?.author
        masterView?.addSubview(authorLabel!)
        authorLabel?.addAnchors(left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: titleLabel)
        authorLabel?.addAnchorsAndSize(width: width, height: 15, left: 15, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: icon)
        
        categoryLabel = UILabel()
        categoryLabel?.textColor = .gray
        categoryLabel?.font = .systemFont(ofSize: 18)
        categoryLabel?.text = libro?.category
        masterView?.addSubview(categoryLabel!)
        categoryLabel?.addAnchors(left: nil, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: authorLabel)
        categoryLabel?.addAnchorsAndSize(width: width, height: 15, left: 15, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: icon)
        
       /* line = UIView()
        line?.backgroundColor = UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        masterView?.addSubview(line!)
        line?.addAnchorsAndSize(width: width, height: 2, left: 20, top: 20, right: 20, bottom: 0, withAnchor: .top, relativeToView: categoryLabel)*/
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
