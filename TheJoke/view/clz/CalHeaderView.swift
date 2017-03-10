//
//  CalHeaderView.swift
//  TheJoke
//
//  Created by Whoami on 2017/3/3.
//  Copyright © 2017年 Whoami. All rights reserved.
//

import UIKit

@IBDesignable
class CalHeaderView: UIView {
    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var todayButton: UIButton!
//    
//    @IBOutlet var firstLabel: UILabel!
//    @IBOutlet var secoundLabel: UILabel!
//    @IBOutlet var thirdLabel: UILabel!
//    @IBOutlet var fouthLabel: UILabel!
//    @IBOutlet var fifthLabel: UILabel!
//    @IBOutlet var sixthLabel: UILabel!
//    @IBOutlet var seventhLabel: UILabel!
    var view: UIView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initXibView()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        initXibView()
    }
    
    func initXibView(){
        view = loadViewFromNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Make the view stretch with containing view
//        view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CalHeaderView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
