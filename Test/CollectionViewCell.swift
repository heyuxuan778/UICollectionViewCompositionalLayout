import UIKit

class CollectionViewCell: UICollectionViewCell {
    lazy var imageView:UIImageView = {
        let image = UIImage(named: "1")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    override func layoutSubviews() {
        imageView.frame = bounds
        addSubview(imageView)
    }
}
