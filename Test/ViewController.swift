import UIKit
class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: ViewController.creatLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "reusedCell")
        self.view.addSubview(collectionView)
        
    }
    static func creatLayout()->UICollectionViewCompositionalLayout{
        let colItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalHeight(1)))
        colItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        let colItem2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        colItem2.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        let colGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1)),
            subitem: colItem2,count: 3)
        let colGroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(2/5)),
            subitems: [colItem,colGroup])
        let section = NSCollectionLayoutSection(group: colGroup2)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusedCell", for: indexPath) as! CollectionViewCell
        cell.imageView.contentMode = .scaleAspectFill
        return cell
    }
}

