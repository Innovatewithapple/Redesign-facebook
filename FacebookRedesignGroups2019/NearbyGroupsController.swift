//
// 
import LBTATools

struct Group {
    let name, imageName: String
}

class NearbyCell: LBTAListCell<Group> {
    
    let imageView = UIImageView()
    let nameLabel = UILabel(text: "Group Name", font: .systemFont(ofSize: 12, weight: .semibold), numberOfLines: 2)
    
    override var item: Group! {
        didSet {
            imageView.image = UIImage(named: item.imageName)
            nameLabel.text = item.name
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        stack(imageView, nameLabel)
    }
}

class NearbyGroupsController: LBTAListHeaderController<NearbyCell, Group, UICollectionReusableView>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 120, height: view.frame.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [
            .init(name: "Co-Ed Hikers of Colorado University", imageName: "hike"),
            .init(name: "Other People's Puppies", imageName: "puppy"),
            .init(name: "Secrets to Seasonal Gardening", imageName: "gardening"),
            .init(name: "Food for everyone!", imageName: "food"),
            .init(name: "Other People's Puppies", imageName: "food"),
        ]
    }
    
}
