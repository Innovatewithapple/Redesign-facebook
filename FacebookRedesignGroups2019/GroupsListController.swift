//
//  GroupsListController.swift
//  FacebookRedesignGroups2019

import LBTATools

struct Post {
    let profileImageName, name, timeAgo, messageText, postImageName: String
}

class PostCell: LBTAListCell<Post> {
    
    let profileImageView = CircularImageView(width: 40)
    let nameLabel = UILabel(text: "User Name", font: .boldSystemFont(ofSize: 14))
    let timeAgoLabel = UILabel(text: "12 mins", font: .systemFont(ofSize: 12), textColor: .lightGray)
    let messageLabel = UILabel(text: "Post Message", font: .systemFont(ofSize: 14), numberOfLines: 0)
    let postImageView = UIImageView()
    let globeImageView = CircularImageView(width: 12)
    
    override var item: Post! {
        didSet {
            profileImageView.image = UIImage(named: item.profileImageName)
            nameLabel.text = item.name
            messageLabel.text = item.messageText
            postImageView.image = UIImage(named: item.postImageName)
            timeAgoLabel.text = "\(item.timeAgo) • "
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        globeImageView.image = #imageLiteral(resourceName: "earth-globe")
        
        stack(
            hstack(profileImageView,
                   stack(nameLabel,
                         hstack(timeAgoLabel, globeImageView, UIView()), spacing: 0),
                   spacing: 8).withMargins(.init(top: 8, left: 12, bottom: 0, right: 0)),
            hstack(messageLabel).withMargins(.init(top: 0, left: 12, bottom: 0, right: 12)),
            postImageView,
            spacing: 12
        )
        
    }
}

class GroupsListController: LBTAListHeaderController<PostCell, Post, NearbyHeader>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 210)
    }
    
    // padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 6, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // auto sizing cells later....?
        return .init(width: view.frame.width, height: 420)
    }
    
    let optionsController = GroupsOptionsController(scrollDirection: .horizontal)
    
    lazy var customNavBar: UIView = {
        let v = UIView(backgroundColor: .white)
        
        let groupsLabel = UILabel(text: "Groups", font: .boldSystemFont(ofSize: 32))
        let stackView = v.stack(
            UIView(),
            v.stack(groupsLabel).padLeft(20),
            self.optionsController.view.withHeight(34),
            spacing: 8
            ).withMargins(.init(top: 0, left: 0, bottom: 12, right: 0))
        
//        v.setupShadow(opacity: 0.10, radius: 8, offset: .init(width: 0, height: 6), color: .black)
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.900582552, green: 0.9012405276, blue: 0.9075868726, alpha: 1)
        
        view.addSubview(customNavBar)
        let navBarHeight: CGFloat = 150
        customNavBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: navBarHeight))
        collectionView.contentInset = .init(top: navBarHeight + 4, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = collectionView.contentInset
        
        setupStatusBarCover()
        
        items = [
            Post.init(profileImageName: "post_profile", name: "Brianna Valerie • Other People's Puppies", timeAgo: "8 hrs", messageText: "Met this adorable little pup on my lunch break today. Her name is Bean and I will love her forever", postImageName: "post_puppy"),
            Post.init(profileImageName: "post_profile", name: "Brianna Valerie • Other People's Puppies", timeAgo: "2 weeks", messageText: "This is an amazing course worth checking out right now and I'm doing my best to work on the Chatting Features for when two users match with each other. This text is going to span a lot of lines!!!", postImageName: "tinder_firestore_500"),
            Post.init(profileImageName: "post_profile", name: "Brianna Valerie • Other People's Puppies", timeAgo: "8 hrs", messageText: "Met this adorable little pup on my lunch break today. Her name is Bean and I will love her forever", postImageName: "post_puppy"),
            Post.init(profileImageName: "post_profile", name: "Brianna Valerie • Other People's Puppies", timeAgo: "2 weeks", messageText: "This is an amazing course worth checking out right now and I'm doing my best to work on the Chatting Features for when two users match with each other. This text is going to span a lot of lines!!!", postImageName: "tinder_firestore_500"),
            Post.init(profileImageName: "post_profile", name: "Brianna Valerie • Other People's Puppies", timeAgo: "8 hrs", messageText: "Met this adorable little pup on my lunch break today. Her name is Bean and I will love her forever", postImageName: "post_puppy"),
            Post.init(profileImageName: "post_profile", name: "Brianna Valerie • Other People's Puppies", timeAgo: "2 weeks", messageText: "This is an amazing course worth checking out right now and I'm doing my best to work on the Chatting Features for when two users match with each other. This text is going to span a lot of lines!!!", postImageName: "tinder_firestore_500"),
        ]
    }
    
    fileprivate func setupStatusBarCover() {
        let cover = UIView(backgroundColor: .white)
        view.addSubview(cover)
        cover.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.topAnchor, trailing: view.trailingAnchor)
    }
    
}
