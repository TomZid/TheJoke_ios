//
//  Extensions.swift
//  TheJoke
//
//  Created by Whoami on 2017/3/9.
//  Copyright © 2017年 Whoami. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
