//
//  Message.swift
//  TheJoke
//
//  Created by Whoami on 2017/3/6.
//  Copyright © 2017年 Whoami. All rights reserved.
//

import Foundation

class Message: NSObject, DateSortable {
    
    let date: Date
    let text: String
    let user: User
    
    init(date: Date, text: String, user: User) {
        self.date = date
        self.text = text
        self.user = user
    }
    
}
