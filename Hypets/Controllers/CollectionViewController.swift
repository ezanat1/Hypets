import UIKit
import ProgressHUD
class CollectionViewController: UIViewController {
    
    
    
    var imageString: String? = nil
    var facts = [DogFacts]()
    private var collectionView: UICollectionView?
//    private let followTopic: UIButton = {
//        let button = UIButton()
//        button.layer.cornerRadius = 9
//        button.setTitle("Follow Topic", for: .normal)
//        button.backgroundColor =  .cyan
//        return button
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView?.register(VerticalViewCell.self, forCellWithReuseIdentifier: VerticalViewCell.identifier)
        collectionView?.isPagingEnabled = true
        collectionView?.dataSource = self
        guard let image = imageString else {
            return
        }
        
        collectionView?.backgroundView = UIImageView(image: UIImage(named: image))
        view.addSubview(collectionView!)
    
        let url = "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all"
        ProgressHUD.animationType = .horizontalCirclesPulse
        ProgressHUD.colorBackground = .blue
        ProgressHUD.colorProgress = .systemBlue
        if facts.isEmpty{
            getData(from: url)
        }
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    @objc func saveTapped(){
        print("save Tapped")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds

       
    }
    
    private func getData(from url: String){
       
        DispatchQueue.global().async {
            if let newUrl = URL(string: url){
                URLSession.shared.dataTask(with: newUrl,completionHandler: { data, response,error in
                    guard let data = data, error == nil else{
                        return
                    }
                   
                    var result : [Facts]?
                    do{
                        result = try JSONDecoder().decode([Facts].self, from: data)
                        print("yes")
                    }
                    catch{
                        print("Failed to convert data \(error)")
                    }
                    guard let json = result else{
                        return
                    }
                    json.forEach({ fact in
                        let facts = DogFacts(fact: fact.fact)
                        print(fact)
                        self.facts.append(facts)
                    })
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                    ProgressHUD.dismiss()
                    
                    
                }).resume()
                
            }
        }
        ProgressHUD.dismiss()
        
        
        
     
    }


}

extension CollectionViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = facts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalViewCell.identifier, for: indexPath) as! VerticalViewCell
        cell.configure(with: model)
        return cell

    }



}
