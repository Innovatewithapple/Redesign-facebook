//
//  NearbyHeader.swift
//  FacebookRedesignGroups2019
//
//  Created by Brian Voong on 5/2/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

class NearbyHeader: UICollectionReusableView {
    
    let titleLabel = UILabel(text: "Nearby", font: .boldSystemFont(ofSize: 18))
    let nearbyGroupsController = NearbyGroupsController(scrollDirection: .horizontal)
    
    let radiusLabel = UILabel(text: "5 mi. radius", font: .systemFont(ofSize: 12), textColor: .darkGray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        stack(
            hstack(titleLabel.withHeight(40), radiusLabel).withMargins(.init(top: 0, left: 16, bottom: 0, right: 16)),
            nearbyGroupsController.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
