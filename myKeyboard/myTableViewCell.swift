//
//  myTableViewCell.swift
//  myKeyboard
//
//  Created by haogaoming on 2018/4/27.
//  Copyright © 2018年 郝高明. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {
    
    lazy var myButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        button.isUserInteractionEnabled = false
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //添加按钮
        self.contentView.addSubview(myButton)
        myButton.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.contentView)
            make.height.equalTo(35)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
