//
// 
import LBTATools

struct Option {
    let title, iconName: String
}

class OptionCell: LBTAListCell<Option> {
    
    let titleLabel = UILabel(text: "Title", font: .boldSystemFont(ofSize: 14))
    let iconImageView = UIImageView()
    
    override var item: Option! {
        didSet {
            titleLabel.text = item.title
            iconImageView.image = UIImage(named: item.iconName)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        iconImageView.contentMode = .scaleAspectFit
        let sv = stack(hstack(iconImageView.withWidth(18), titleLabel, spacing: 8))
        sv.alignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}

class GroupsOptionsController: LBTAListController<OptionCell, Option>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // auto sizing????
        return .init(width: 150, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            .init(title: "Your Groups", iconName: "multiple-users-silhouette"),
            .init(title: "Discover", iconName: "searching-magnifying-glass"),
            .init(title: "Your Groups", iconName: "multiple-users-silhouette"),
            .init(title: "Discover", iconName: "searching-magnifying-glass"),
            .init(title: "Your Groups", iconName: "multiple-users-silhouette"),
            .init(title: "Discover", iconName: "searching-magnifying-glass"),
        ]
    }
    
}
