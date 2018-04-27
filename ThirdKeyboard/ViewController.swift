//
//  ViewController.swift
//  ThirdKeyboard
//
//  Created by haogaoming on 2018/4/24.
//  Copyright © 2018年 郝高明. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let textfiled = UITextField(frame: CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 60))
        textfiled.borderStyle = .roundedRect
        self.view.addSubview(textfiled)
        
        let lable = UILabel(frame: CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 50))
        lable.text = "请到 设置-->通用-->键盘-->添加第三方键盘"
        lable.textAlignment = .center
        lable.textColor = UIColor.red
        lable.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(rawValue: 1))
        self.view.addSubview(lable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

