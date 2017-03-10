//
//  CalEventViewController.swift
//  TheJoke
//
//  Created by Whoami on 2017/3/6.
//  Copyright © 2017年 Whoami. All rights reserved.
//

import UIKit
import IGListKit

class CalEventViewController: UIViewController {
    
    
    let collectionView: IGListCollectionView = {
        let view = IGListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = UIColor.black
        return view
    }()
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let pathfinder = Pathfinder()
    let wxScanner = WxScanner()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loader.loadLatest()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        pathfinder.delegate = self
        pathfinder.connect()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension CalEventViewController: IGListAdapterDataSource {
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
//        var items: [IGListDiffable] = [IGListDiffable]()
//        if let weathers = wxScanner.currentWeather as? IGListDiffable {
//            items = [weathers]
//        }
//        if let messages = pathfinder.messages as? IGListDiffable {
//            items += [messages]
//        }
        
//        items += loader.entries as [IGListDiffable]
        
        var items: [IGListDiffable] = [wxScanner.currentWeather]
        
        items += pathfinder.messages as [IGListDiffable]
        return items.sorted(by: { (left: Any, right: Any) -> Bool in
            if let left = left as? DateSortable, let right = right as? DateSortable {
                return left.date > right.date
            }
            return false
        })
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        if object is Message {
            return MessageSectionController()
        } else if object is Weather {
            return WeatherSectionController()
        }
        return WeatherSectionController()
    }
    func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
}

// MARK: - PathfinderDelegate
extension CalEventViewController: PathfinderDelegate {
    func pathfinderDidUpdateMessages(pathfinder: Pathfinder) {
        adapter.performUpdates(animated: true)
    }
}
