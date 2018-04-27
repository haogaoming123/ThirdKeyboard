//
//  twoTableViewCell.swift
//  myKeyboard
//
//  Created by haogaoming on 2018/4/27.
//  Copyright © 2018年 郝高明. All rights reserved.
//

import UIKit

protocol TwoTableViewCelldelegate:NSObjectProtocol {
    func twoTableviewcellClick(_ str:String)
}

class twoTableViewCell: UITableViewCell {

    weak var delegate: TwoTableViewCelldelegate?
    
    lazy var myButton1: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 1))
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(selectClick(_:)), for: .touchUpInside )
        return button
    }()
    
    lazy var myButton2: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 1))
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(selectClick(_:)), for: .touchUpInside )
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //添加按钮
        self.contentView.addSubview(myButton1)
        myButton1.snp.makeConstraints { (make) in
            make.left.top.equalTo(self.contentView)
            make.height.equalTo(50)
            make.right.equalTo(self.contentView.snp.centerX).offset(-8)
        }
        
        self.contentView.addSubview(myButton2)
        myButton2.snp.makeConstraints { (make) in
            make.height.top.equalTo(myButton1)
            make.left.equalTo(self.contentView.snp.centerX).offset(8)
            make.right.equalTo(self.contentView.snp.right)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func selectClick(_ btn:UIButton) {
        guard let str = btn.titleLabel?.text else { return }
        delegate?.twoTableviewcellClick(str)
    }
}
