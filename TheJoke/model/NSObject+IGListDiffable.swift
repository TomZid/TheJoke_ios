//
//  NSObject+IGListDiffable.swift
//  TheJoke
//
//  Created by Whoami on 2017/3/6.
//  Copyright © 2017年 Whoami. All rights reserved.
//

import Foundation

import Foundation
import IGListKit

// MARK: - IGListDiffable
extension NSObject: IGListDiffable {
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}
