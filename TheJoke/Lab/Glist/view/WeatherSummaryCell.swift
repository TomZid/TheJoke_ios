//
//  WeatherSummaryCell.swift
//  TheJoke
//
//  Created by Whoami on 2017/3/6.
//  Copyright © 2017年 Whoami. All rights reserved.
//

import UIKit

class WeatherSummaryCell: UICollectionViewCell {
    
    private let expandLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = AppFont(size: 30)
        label.textColor = UIColor(hex6: 0x44758b)
        label.textAlignment = .center
        label.text = ">>"
        label.sizeToFit()
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        let subtitleAttributes = [
            NSFontAttributeName: AppFont(size: 14),
            NSForegroundColorAttributeName: UIColor(hex6: 0x42c84b),
            NSParagraphStyleAttributeName: paragraphStyle
        ]
        let titleAttributes = [
            NSFontAttributeName: AppFont(size: 24),
            NSForegroundColorAttributeName: UIColor.white
        ]
        let attributedText = NSMutableAttributedString(string: "LATEST\n", attributes: subtitleAttributes)
        attributedText.append(NSAttributedString(string: "WEATHER", attributes: titleAttributes))
        label.attributedText = attributedText
        label.sizeToFit()
        
        return label
    }()
    
    func setExpanded(_ expanded: Bool) {
        self.expandLabel.transform = expanded ? CGAffineTransform(rotationAngle: CGFloat.pi / 2) : CGAffineTransform.identity
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(expandLabel)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let insets = CommonInsets
        titleLabel.frame = CGRect(x: insets.left, y: 0, width: titleLabel.bounds.width, height: bounds.height)
        expandLabel.center = CGPoint(x: bounds.width - expandLabel.bounds.width/2 - insets.right, y: bounds.height/2)
    }
    
}
