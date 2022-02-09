import UIKit

class HomeViewController: UIViewController{

    var dismissButton : UIButton?
    var labelWelcome : UILabel?
    var labelName : UILabel?
    var tempView : UIView?
    var booksButton : UIButton?
    var categoriesButton : UIButton?
    var authorsButton : UIButton?
    var bookTableView : UITableView?
    var categoriesView : UIView?
    var authorsView : UIView?
    var fantasyButton : UIButton?
    var loveButton : UIButton?
    var cookingButton : UIButton?
    var programmingButton : UIButton?
    var historyButton : UIButton?
    var scienceButton : UIButton?
    var jkrButton : UIButton?
    var danBrownButton : UIButton?
    var danielleSteelButton : UIButton?
    var lewisCarolButton : UIButton?
    var jamesPattersonButton : UIButton?
    
    var swordImage : UIImageView?
    var wizardHat : UIImageView?
    var puppiesImage : UIImageView?
    var puppuesImage2 : UIImageView?
    var loveImage : UIImageView?
    var loveImage2 : UIImageView?
    var cookingImage : UIImageView?
    var cookingImage2 : UIImageView?
    var programmingImage : UIImageView?
    var programmingImage2 : UIImageView?
    var historyImage : UIImageView?
    var historyImage2 : UIImageView?
    
   
    var bookData = [Work]()
    //var workData = [Excerpt]()
    var authorData = [Entry]()
    var heroStats = [HeroStats]()
    var descriptionData : Created?
    
    var isCategories : Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDescription()
        fetchCategory(isWork: false,category: "programming")
        view.backgroundColor = .systemGray5
        initUI()
    }
    
    func fetchDescription(){
    
        let urlString = "https://openlibrary.org/works/OL8193508W.json"
        downloadJSONCDescription(urlString: urlString){
            data in
            let lol = data
        }
        
    }
    
    func fetchCategory(isWork: Bool, category: String){
        
        //var urlString = ""

        if isWork{
            let urlString = "https://openlibrary.org/authors/\(category)/works.json"
            downloadJSONAuthor(urlString: urlString){
                data in
                self.authorData = data
            }
            
        }else{
            let urlString = "https://openlibrary.org/subjects/\(category).json"
            downloadJSONCategories(urlString: urlString){
                data in
                self.bookData = data
            }
        }
        
        
    }
    func downloadJSONAuthor(urlString: String,completed: @escaping ([Entry]) -> ()){
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error == nil{
                do{
                    let result = try JSONDecoder().decode(AuthorData.self, from: data!)
                    DispatchQueue.main.async {
                        completed(result.entries)
                        self.bookTableView?.reloadData()

                    }
                }catch{
                    print("json error owrks")
                }
            }
            
        }.resume()
        
    }

    
    func downloadJSONCategories(urlString: String,completed: @escaping ([Work]) -> ()){
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error == nil{
                do{
                    let result = try JSONDecoder().decode(BookFox.self, from: data!)
                    DispatchQueue.main.async {
                        completed(result.works)
                        self.bookTableView?.reloadData()

                    }
                }catch{
                    print("json error")
                }
            }
            
        }.resume()
        
    }
    
    func downloadJSONCDescription(urlString: String,completed: @escaping (Created) -> ()){
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error == nil{
                do{
                    let result = try JSONDecoder().decode(DescriptionData.self, from: data!)
                    DispatchQueue.main.async {
                        completed(result.descriptionDataDescription)
                        self.bookTableView?.reloadData()

                    }
                }catch{
                    print("json error desc")
                }
            }
            
        }.resume()
        
    }
    
    
    func initUI(){
        
        dismissButton = UIButton(frame: CGRect(x: 15, y: 50, width: 40, height: 40))
        dismissButton?.addTarget(self, action: #selector(dismissHome), for: .touchUpInside)
        dismissButton?.setImage(UIImage(named: "back"), for: .normal)
        view.addSubview(dismissButton!)
        
        labelWelcome = UILabel()
        labelWelcome?.font = .systemFont(ofSize: 23)
        labelWelcome?.text = "Bienvenido de vuelta"
        view.addSubview(labelWelcome!)
        labelWelcome?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 0, right: 20, bottom: nil, withAnchor: .top, relativeToView: dismissButton)
        
        labelName = UILabel()
        labelName?.font = .boldSystemFont(ofSize: 42)
        labelName?.textColor = UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        labelName?.text = "Jesús"
        view.addSubview(labelName!)
        labelName?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: -20, right: 20, bottom: nil, withAnchor: .top, relativeToView: labelWelcome)
        
        tempView = UIView()
        tempView?.layer.cornerRadius = 0
        tempView?.backgroundColor = UIColor(red: 9/255, green: 21/255, blue: 100/255, alpha: 1)
        view.addSubview(tempView!)
        tempView?.addAnchorsAndSize(width: nil, height: 60, left: 0, top: 10, right: 0, bottom: nil, withAnchor: .top, relativeToView: labelName)
        
        booksButton = UIButton()
        booksButton?.addTarget(self, action: #selector(tapBooks), for: .touchUpInside)
        booksButton?.setTitle("Libros", for: .normal)
        booksButton?.titleLabel?.font = .boldSystemFont(ofSize: 21)
        booksButton?.backgroundColor = .clear
        tempView?.addSubview(booksButton!)
        booksButton?.addAnchorsAndSize(width: 130, height: nil, left: 0, top: 0, right: nil, bottom: 0)
        
        categoriesButton = UIButton()
        categoriesButton?.addTarget(self, action: #selector(tapCategories), for: .touchUpInside)
        categoriesButton?.setTitle("Categorías", for: .normal)
        categoriesButton?.titleLabel?.font = .boldSystemFont(ofSize: 20)
        categoriesButton?.backgroundColor = .blue
        tempView?.addSubview(categoriesButton!)
        categoriesButton?.addAnchorsAndSize(width: 150, height: nil, left: 0, top: 0, right: nil, bottom: 0,withAnchor: .left, relativeToView: booksButton)
        
        authorsButton = UIButton()
        authorsButton?.addTarget(self, action: #selector(tapAuthors), for: .touchUpInside)
        authorsButton?.setTitle("Autores", for: .normal)
        authorsButton?.titleLabel?.font = .boldSystemFont(ofSize: 21)
        authorsButton?.backgroundColor = .systemTeal
        tempView?.addSubview(authorsButton!)
        authorsButton?.addAnchorsAndSize(width: nil, height: nil, left: 0, top: 0, right: 0, bottom: 0, withAnchor: .left, relativeToView: categoriesButton)

        bookTableView = UITableView()
        bookTableView?.delegate = self
        bookTableView?.dataSource = self
        bookTableView?.isHidden = false
        view.addSubview(bookTableView!)
        bookTableView?.addAnchorsAndSize(width: nil, height: nil, left: 20, top: 15, right: 20, bottom: 40, withAnchor: .top, relativeToView: tempView)
        
        categoriesView = UIView()
        categoriesView?.isHidden = true
        categoriesView?.backgroundColor = .white
        categoriesView?.layer.cornerRadius = 20
        view.addSubview(categoriesView!)
        categoriesView?.addAnchorsAndSize(width: 400, height: 2000, left: 25, top: 15, right: 25, bottom: 100, withAnchor: .top, relativeToView: tempView)
        
        authorsView = UIView()
        authorsView?.isHidden = true
        authorsView?.backgroundColor = .white
        authorsView?.layer.cornerRadius = 20
        view.addSubview(authorsView!)
        authorsView?.addAnchorsAndSize(width: 400, height: 2000, left: 25, top: 15, right: 25, bottom: 30, withAnchor: .top, relativeToView: tempView)
        
        fantasyButton = UIButton()
        fantasyButton?.layer.cornerRadius = 15
        fantasyButton?.addTarget(self, action: #selector(fantasyPress), for: .touchUpInside)
        fantasyButton?.setTitle("Fantasy", for: .normal)
        fantasyButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        fantasyButton?.setTitleColor(.blue, for: .normal)
        fantasyButton?.backgroundColor = .systemGray4
        categoriesView?.addSubview(fantasyButton!)
        fantasyButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 20, right: 20, bottom: nil)
        
        
        wizardHat = UIImageView()
        wizardHat?.image = UIImage(named: "f")
        fantasyButton?.addSubview(wizardHat!)
        wizardHat?.addAnchorsAndSize(width: 40, height: 10, left: 25, top: 10, right: nil, bottom: 10)
        
        loveButton = UIButton()
        loveButton?.layer.cornerRadius = 15
        loveButton?.addTarget(self, action: #selector(lovePress), for: .touchUpInside)
        loveButton?.setTitle("Love", for: .normal)
        loveButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        loveButton?.setTitleColor(.blue, for: .normal)
        loveButton?.backgroundColor = .systemGray4
        categoriesView?.addSubview(loveButton!)
        loveButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: fantasyButton)
        

        loveImage2 = UIImageView()
        loveImage2?.image = UIImage(named: "love")
        loveButton?.addSubview(loveImage2!)
        loveImage2?.addAnchorsAndSize(width: 40, height: 10, left: 25, top: 12, right: nil, bottom: 12)
        
        cookingButton = UIButton()
        cookingButton?.layer.cornerRadius = 15
        cookingButton?.addTarget(self, action: #selector(cookingPress), for: .touchUpInside)
        cookingButton?.setTitle("Cooking", for: .normal)
        cookingButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        cookingButton?.setTitleColor(.blue, for: .normal)
        cookingButton?.backgroundColor = .systemGray4
        categoriesView?.addSubview(cookingButton!)
        cookingButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: loveButton)
 
        cookingImage2 = UIImageView()
        cookingImage2?.image = UIImage(named: "cooking")
        cookingButton?.addSubview(cookingImage2!)
        cookingImage2?.addAnchorsAndSize(width: 40, height: 10, left: 25, top: 10, right: nil, bottom: 10)
        
        programmingButton = UIButton()
        programmingButton?.layer.cornerRadius = 15
        programmingButton?.addTarget(self, action: #selector(programmingPress), for: .touchUpInside)
        programmingButton?.setTitle("Programming", for: .normal)
        programmingButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        programmingButton?.setTitleColor(.blue, for: .normal)
        programmingButton?.backgroundColor = .systemGray4
        categoriesView?.addSubview(programmingButton!)
        programmingButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: cookingButton)
        

        
        programmingImage2 = UIImageView()
        programmingImage2?.image = UIImage(named: "programming")
        programmingButton?.addSubview(programmingImage2!)
        programmingImage2?.addAnchorsAndSize(width: 40, height: 10, left: 25, top: 10, right: nil, bottom: 10)
        
        historyButton = UIButton()
        historyButton?.layer.cornerRadius = 15
        historyButton?.addTarget(self, action: #selector(historyPress), for: .touchUpInside)
        historyButton?.setTitle("History", for: .normal)
        historyButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        historyButton?.setTitleColor(.blue, for: .normal)
        historyButton?.backgroundColor = .systemGray4
        categoriesView?.addSubview(historyButton!)
        historyButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: programmingButton)
        
        historyImage = UIImageView()
        historyImage?.image = UIImage(named: "history")
        historyButton?.addSubview(historyImage!)
        historyImage?.addAnchorsAndSize(width: 40, height: 10, left: 25, top: 10, right: nil, bottom: 10)
        
        scienceButton = UIButton()
        scienceButton?.layer.cornerRadius = 15
        scienceButton?.addTarget(self, action: #selector(sciencePress), for: .touchUpInside)
        scienceButton?.setTitle("Puppies", for: .normal)
        scienceButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        scienceButton?.setTitleColor(.blue, for: .normal)
        scienceButton?.backgroundColor = .systemGray4
        categoriesView?.addSubview(scienceButton!)
        scienceButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: historyButton)
        
        puppiesImage = UIImageView()
        puppiesImage?.image = UIImage(named: "puppies")
        scienceButton?.addSubview(puppiesImage!)
        puppiesImage?.addAnchorsAndSize(width: 40, height: 10, left: 25, top: 10, right: nil, bottom: 10)
        
        
        jkrButton = UIButton()
        jkrButton?.layer.cornerRadius = 15
        jkrButton?.addTarget(self, action: #selector(jkrPress), for: .touchUpInside)
        jkrButton?.backgroundColor = .systemGray3
        jkrButton?.setTitle("JK Rowling", for: .normal)
        jkrButton?.setTitleColor(.systemCyan, for: .normal)
        jkrButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        authorsView?.addSubview(jkrButton!)
        jkrButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 20, right: 20, bottom: nil)
        
        danBrownButton = UIButton()
        danBrownButton?.layer.cornerRadius = 15
        danBrownButton?.addTarget(self, action: #selector(danBrownPress), for: .touchUpInside)
        danBrownButton?.backgroundColor = .systemGray3
        danBrownButton?.setTitle("Dan Brown", for: .normal)
        danBrownButton?.setTitleColor(.systemCyan, for: .normal)
        danBrownButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        authorsView?.addSubview(danBrownButton!)
        danBrownButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: jkrButton)
        
        danielleSteelButton = UIButton()
        danielleSteelButton?.layer.cornerRadius = 15
        danielleSteelButton?.addTarget(self, action: #selector(danielleSteelPress), for: .touchUpInside)
        danielleSteelButton?.backgroundColor = .systemGray3
        danielleSteelButton?.setTitle("Danielle Steel", for: .normal)
        danielleSteelButton?.setTitleColor(.systemCyan, for: .normal)
        danielleSteelButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        authorsView?.addSubview(danielleSteelButton!)
        danielleSteelButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: danBrownButton)
        
        jamesPattersonButton = UIButton()
        jamesPattersonButton?.layer.cornerRadius = 15
        jamesPattersonButton?.addTarget(self, action: #selector(jamesPattersonPress), for: .touchUpInside)
        jamesPattersonButton?.backgroundColor = .systemGray3
        jamesPattersonButton?.setTitle("James Patterson", for: .normal)
        jamesPattersonButton?.setTitleColor(.systemCyan, for: .normal)
        jamesPattersonButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        authorsView?.addSubview(jamesPattersonButton!)
        jamesPattersonButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: danielleSteelButton)
        
        lewisCarolButton = UIButton()
        lewisCarolButton?.layer.cornerRadius = 15
        lewisCarolButton?.addTarget(self, action: #selector(lewisCarolPress), for: .touchUpInside)
        lewisCarolButton?.backgroundColor = .systemGray3
        lewisCarolButton?.setTitle("Lewis Carol", for: .normal)
        lewisCarolButton?.setTitleColor(.systemCyan, for: .normal)
        lewisCarolButton?.titleLabel?.font = .boldSystemFont(ofSize: 23)
        authorsView?.addSubview(lewisCarolButton!)
        lewisCarolButton?.addAnchorsAndSize(width: 400, height: 70, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: jamesPattersonButton)
    

    }
    
    @objc func fantasyPress(){
        isCategories = true
        fetchCategory(isWork: false, category: "fantasy")
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
        authorsView?.isHidden = true
    }
    
    @objc func lovePress(){
        isCategories = true
        fetchCategory(isWork: false, category: "love")
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
        authorsView?.isHidden = true

    }
    
    @objc func cookingPress(){
        isCategories = true
        fetchCategory(isWork: false, category: "cooking")
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
        authorsView?.isHidden = true

    }
    
    @objc func programmingPress(){
        isCategories = true
        fetchCategory(isWork: false, category: "programming")
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
        authorsView?.isHidden = true

    }
    
    @objc func historyPress(){
        isCategories = true
        fetchCategory(isWork: false, category: "history")
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
        authorsView?.isHidden = true
        
    }
    
    @objc func sciencePress(){
        isCategories = true
        fetchCategory(isWork: false, category: "puppies")
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
        authorsView?.isHidden = true
    }
    
    @objc func jkrPress(){
        isCategories = false
        fetchCategory(isWork: true, category: "OL23919A"/*"OL23919A"*/)
        authorsView?.isHidden = true
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
    }
    
    @objc func danBrownPress(){
        isCategories = false
        fetchCategory(isWork: true, category: "OL66700A")
        authorsView?.isHidden = true
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
    }
    
    @objc func danielleSteelPress(){
        isCategories = false
        fetchCategory(isWork: true, category: "OL24452A")
        authorsView?.isHidden = true
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
    }
    
    @objc func lewisCarolPress(){
        isCategories = false
        fetchCategory(isWork: true, category: "OL946144A")
        authorsView?.isHidden = true
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
    }
    
    @objc func jamesPattersonPress(){
        isCategories = false
        fetchCategory(isWork: true, category: "OL6812710A")
        authorsView?.isHidden = true
        categoriesView?.isHidden = true
        bookTableView?.isHidden = false
    }
    
    
    
    @objc func dismissHome(){
        dismiss(animated: true)
    }
    
    @objc func tapBooks(){
        labelName?.textColor = UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        bookTableView?.reloadData()
        bookTableView?.isHidden = false
        categoriesView?.isHidden = true
        authorsView?.isHidden = true
    }
    
    @objc func tapCategories(){
        labelName?.textColor = .blue
        bookTableView?.reloadData()
        bookTableView?.isHidden = true
        categoriesView?.isHidden = false
        authorsView?.isHidden = true
    }
    
    @objc func tapAuthors(){
        labelName?.textColor = .systemCyan
        bookTableView?.reloadData()
        bookTableView?.isHidden = true
        categoriesView?.isHidden = true
        authorsView?.isHidden = false
    }
    

}

extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if isCategories ?? true{
            return bookData.count
        }else{
            return  authorData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = LibroTableViewCell()
        if isCategories ?? true{
            cell.titleLabel?.text = bookData[indexPath.row].title
            cell.categoryLabel?.text = bookData[indexPath.row].subject[0]
            cell.authorLabel?.text = bookData[indexPath.row].authors[0].name
            let url = URL(string: "https://covers.openlibrary.org/b/ID/\(bookData[indexPath.row].cover_id)-M.jpg")
                if let data = try? Data(contentsOf: url!)
                {
                    cell.icon?.image = UIImage(data: data)!
                }
        
        }else{
            cell.titleLabel?.text = authorData[indexPath.row].title
            cell.categoryLabel?.text = authorData[indexPath.row].subjects?[0] ?? ""
            cell.authorLabel?.text = authorData[indexPath.row].subject_times?[0] ?? ""
            let url = URL(string: "https://covers.openlibrary.org/b/ID/\(authorData[indexPath.row].covers? [0] ?? 0)-M.jpg")
                if let data = try? Data(contentsOf: url!)
                {
                    cell.icon?.image = UIImage(data: data)!
                }
            
        }
        
        //cell.categoryLabel?.text = authorData[indexPath.row].subjects![0]
        //cell.authorLabel?.text = authorData[indexPath.section].description
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        
        if isCategories ?? true{
            detailsVC.titleString = bookData[indexPath.row].title
            detailsVC.authorString = bookData[indexPath.row].authors[0].name
            detailsVC.categoryString = bookData[indexPath.row].subject[0]
            detailsVC.imgString = "https://covers.openlibrary.org/b/ID/\(bookData[indexPath.row].cover_id)-M.jpg"
            detailsVC.descriptionString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        }else{
            detailsVC.titleString = authorData[indexPath.row].title
            detailsVC.imgString = "https://covers.openlibrary.org/b/ID/\(authorData[indexPath.row].covers? [0] ?? 0)-M.jpg"
            detailsVC.authorString = authorData[indexPath.row].subject_times?[0] ?? ""
            detailsVC.categoryString = authorData[indexPath.row].subjects?[0] ?? ""
            detailsVC.descriptionString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        }
        
        /*fetchCategory(isWork: true, category: bookData[indexPath.row].key)
        print(bookData[indexPath.row].key)
        //detailsVC.descriptionString = workData[1].excerpt
        print(workData.capacity)*/
        
        
        present(detailsVC, animated: true, completion: nil)
    }
    
    }
