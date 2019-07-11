//
//  MyTableViewCell.swift
//  Try
//
//  Created by Tejasav Khattar on 11/07/19.
//  Copyright © 2019 Tejasav Khattar. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let mainImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatViews()
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatViews() {
        contentView.addSubview(mainImageView)
        
        mainImageView.layer.cornerRadius = 20
        mainImageView.clipsToBounds = true
        
        mainImageView.set(.top(contentView,12),
                          .leading(contentView,12),
                          .height(40),
                          .width(40),
                          .bottom(contentView,12))
        
        contentView.addSubview(titleLabel)
        
        titleLabel.set(.after(mainImageView,12),
                       .top(contentView,12),
                       .trailing(contentView,12))
        
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.set(.after(mainImageView,12),
                       .below(titleLabel,4),
                       .trailing(contentView,12))
    }
    public func setData(user: User, image: Data) {
        mainImageView.image = UIImage(data: image)
        titleLabel.text = user.name
        subtitleLabel.text = user.email
    }
}
