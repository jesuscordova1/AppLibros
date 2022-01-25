import UIKit

class HomeViewController: UIViewController {

    var dismissButton : UIButton?
    var labelWelcome : UILabel?
    var labelName : UILabel?
    var tempView : UIView?
    var tempLabel : UILabel?
    var tableView : UITableView?
    
    var dataSource : Libros?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getData()
        initUI()
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
        labelName?.font = .boldSystemFont(ofSize: 35)
        labelName?.textColor = UIColor(red: 9/255, green: 21/255, blue: 130/255, alpha: 1)
        //labelName?.backgroundColor = .red
        labelName?.text = "Jesús"
        view.addSubview(labelName!)
        labelName?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: -20, right: 20, bottom: nil, withAnchor: .top, relativeToView: labelWelcome)
        
        tempView = UIView()
        tempView?.layer.cornerRadius = 10
        tempView?.backgroundColor = UIColor(red: 9/255, green: 21/255, blue: 100/255, alpha: 1)
        view.addSubview(tempView!)
        tempView?.addAnchorsAndSize(width: nil, height: 50, left: 15, top: 10, right: 15, bottom: nil, withAnchor: .top, relativeToView: labelName)
        
        tempLabel = UILabel()
        tempLabel?.text = "Libros"
        tempLabel?.textColor = .white
        tempLabel?.font = .boldSystemFont(ofSize: 25)
        tempLabel?.textAlignment = .center
        tempView?.addSubview(tempLabel!)
        tempLabel?.addAnchorsAndSize(width: nil, height: 50, left: 0, top: 0, right: 0, bottom: 0)
        
        tableView = UITableView()
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.addAnchorsAndSize(width: nil, height: nil, left: 20, top: 15, right: 20, bottom: 40, withAnchor: .top, relativeToView: tempView)
    }
    
    func getData(){
        // MARK: Libro
        let teahouseParty = Libro(title: "The Teahouse Party", author: "Ellis Avery", category: "Literatura", imgName: "teahouse", rating: "rating5", description: "La historia de dos mujeres cuyas vidas se cruzan en el Japón de finales del siglo XIX, esta novela es también un retrato de Japón que abre sus puertas a Occidente. Contado a través de la encantadora voz de Aurelia, una huérfana estadounidense adoptada por los propietarios de una escuela de ceremonia del té, este libro es 'historia de amor, historia imaginativa y bildungsroman a partes iguales'.", imgAuthorName: "ellis", descAuthor: "Ellis Avery fue un escritor estadounidense. Ganó dos premios Stonewall Book, uno en 2008 por su novela debut The Teahouse Fire y otro en 2013 por su segunda novela The Last Nude.")
        let lightFell = Libro(title: "Light Fell", author: "Eevan Fallenberg", category: "Ficción", imgName: "lightfell", rating: "rating4", description: "La vida de los chicos ha tomado caminos muy variados. Mientras que algunos se han vuelto extremadamente religiosos, otros son completamente cosmopolitas y seculares, y sus sentimientos hacia su padre van desde la aceptación hasta el amargo resentimiento. Mientras se preparan para este reencuentro, Joseph, sus hijos e incluso Rebecca deben confrontar lo que fue, lo que es y lo que podría haber sido.", imgAuthorName: "eevan", descAuthor: "Evan Fallenberg es nativo de Cleveland, Ohio, y desde 1985 vive en Israel, donde es escritor, profesor y traductor. Sus traducciones recientes incluyen novelas de Batya Gur y Meir Shalev. Se graduó de la Escuela de Servicio Exterior de la Universidad de Georgetown y del programa MFA de Vermont College. Es padre de dos hijos.")
        let desertBoys = Libro(title: "Desert boys", author: "Chris McCormick", category: "Ficción", imgName: "desertboys", rating: "rating3", description: "Desert Boys es un conjunto de historias entrelazadas que unen la vida del protagonista Daley 'Kush' Kushner a través de su tensa relación con su ciudad natal de la infancia en las afueras del desierto del condado de Los Ángeles.", imgAuthorName: "chris", descAuthor: "Chris McCormick es autor de una novela, The Gimmicks (Harper, 2020), una selección de editores del New York Times, y una colección de cuentos, Desert Boys, ganadora del Stonewall Book Award 2017—Barbara Gittings Literature Award. Sus ensayos e historias han aparecido en The Atlantic, Los Angeles Times, Tin House y Ploughshares.")
        let spin = Libro(title: "Spin", author: "Robert Wilson", category: "Ciencia ficción", imgName: "spin", rating: "rating4", description: "Una noche de octubre, cuando tenía diez años, Tyler Dupree se paró en su patio trasero y vio apagarse las estrellas. Todos brillaron a la vez, luego desaparecieron, reemplazados por una barrera negra plana y vacía. Él y sus mejores amigos, Jason y Diane Lawton, habían visto lo que se conoció como el Gran Apagón. Daría forma a sus vidas.", imgAuthorName: "robert", descAuthor: "Robert Charles Wilson, es un autor canadiense de ciencia ficción. Wilson nació en el estado norteamericano de California, pero creció y ha pasado casi toda su vida en Canadá, adquiriendo la nacionalidad en 2007. Publicó por primera vez en la revista Analog Science Fiction, firmando con el pseudónimo Bob Chuck Wilson.")
        let three = Libro(title: "The three body problem", author: "Cixin Liu", category: "Ciencia ficción", imgName: "three", rating: "rating5", description: "La novela de apertura de la trilogía de Cixin Liu sobre el primer contacto con extraterrestres y la lucha clandestina con ellos sobre el futuro de la Tierra y su progreso científico en particular.", imgAuthorName: "cixin", descAuthor: "Liú Cíxīn, es un escritor chino de ciencia ficción, ganador en nueve oportunidades del premio Galaxy y una vez del premio Xingyun (Nébula), y está considerado como uno de los más prolíficos y reconocidos escritores del género en China.")
        let redQueen = Libro(title: "Red Queen", author: "Victoria Aveyard", category: "Romance", imgName: "redQueen", rating: "rating4", description: "El mundo de Mare Barrow está dividido por la sangre: los que tienen rojo y los que tienen plata. Mare y su familia son rojos humildes, destinados a servir a la élite plateada cuyas habilidades sobrenaturales los hacen casi dioses. Mare roba lo que puede para ayudar a su familia a sobrevivir, pero cuando su mejor amigo es reclutado por el ejército, lo juega todo para ganar su libertad. Un giro del destino la lleva al propio palacio real, donde, frente al rey y todos sus nobles, descubre un poder propio, una habilidad que no sabía que tenía. Excepto que su sangre es roja.", imgAuthorName: "victoria", descAuthor: "Victoria Aveyard es una escritora estadounidense de ficción y guiones para jóvenes adultos y fantasía. Es conocida por su novela de fantasía Red Queen. Aveyard escribió la novela un año después de graduarse del programa de escritura de guiones de la Universidad del Sur de California en 2012")
        let cell = Libro(title: "Cell", author: "Stephen King", category: "Suspenso", imgName: "cell", rating: "rating5", description: "El 1 de octubre, Dios está en Su cielo, la bolsa de valores se sitúa en 10.140, la mayoría de los aviones llegan a tiempo y Clayton Riddell, un artista de Maine, está casi saltando por Boylston Street en Boston. Acaba de conseguir un contrato de cómics que finalmente podría permitirle mantener a su familia haciendo arte en lugar de enseñarlo. Ya compró un pequeño (¡pero caro!) regalo para su sufrida esposa, y sabe exactamente lo que obtendrá para su hijo Johnny. ¿Por qué no un pequeño regalo para él? Clay se siente bien con el futuro.", imgAuthorName: "stephen", descAuthor: "Stephen Edwin King (nacido el 21 de septiembre de 1947) es un autor estadounidense de novelas de terror, ficción sobrenatural, suspenso, crimen, ciencia ficción y fantasía. Sus libros han vendido más de 350 millones de copias y muchos han sido adaptados a películas, series de televisión, miniseries y cómics. King ha publicado 63 novelas, incluidas siete bajo el seudónimo de Richard Bachman, y cinco libros de no ficción.")
        let risingStorm = Libro(title: "Rising storm", author: "Erin Hunter", category: "Fantasia", imgName: "risingStorm", rating: "3", description: "Corazón de Fuego, el gato guerrero, se enfrenta a muchos desafíos en su nuevo papel de ayudante del Clan del Trueno, ya que su aprendiz, Zarpa Nublada, se resiste a seguir el código guerrero, Estrella Azul se debilita y Garra de Tigre sigue rondando por el bosque en busca de venganza.", imgAuthorName: "erin", descAuthor: "Erin Hunter es un colectivo de escritores formado por Victoria Holmes, Kate Cary, Cherith Baldry, Inbali Iserles, Tui T. Sutherland, Kasey Widhalm y Rosie Best, especializado en novelas juveniles y de fantasía, con la participación de animales en sus historias.​")
        
        // MARK: Libros
        let libros = Libros(libros: [teahouseParty, lightFell, desertBoys, spin, three, redQueen, cell, risingStorm])
        dataSource = libros
    }
    
    @objc func dismissHome(){
        dismiss(animated: true)
    }
    

}

extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  dataSource?.libros?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libro = dataSource?.libros?[indexPath.row]
        let cell = LibroTableViewCell(libro: libro!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        let libro = dataSource?.libros?[indexPath.row]
        detailsVC.libro = libro
        
        present(detailsVC, animated: true, completion: nil)
    }
    
    }
