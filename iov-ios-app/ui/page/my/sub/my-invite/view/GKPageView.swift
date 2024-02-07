//
//  GKPageView.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2024/2/7.
//

import UIKit
import GKPageScrollView
import JXSegmentedViewExt
import SnapKit
import SwiftUI

class GKPageView: UIView {
    var dataSource = JXSegmentedTitleDataSource()
    
    lazy var headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 0))
        headerView.backgroundColor = .white
        return headerView
    }()
    
    lazy var segmentedView: JXSegmentedView = {
        let segmentedView = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 40))
        
        dataSource.titleNormalFont = .systemFont(ofSize: 14)
        dataSource.titleSelectedFont = .boldSystemFont(ofSize: 15)
        dataSource.titleNormalColor = .gray
        dataSource.titleSelectedColor = .black
        dataSource.isItemSpacingAverageEnabled = true
//        dataSource.itemSpacing = 20
        segmentedView.dataSource = dataSource
        
        let lineView = JXSegmentedIndicatorLineView()
        lineView.indicatorWidth = 50
        lineView.indicatorHeight = 1
        lineView.indicatorColor = .black
        lineView.lineStyle = .lengthen
        segmentedView.indicators = [lineView]
        
        segmentedView.listContainer = pageScrollView.listContainerView
        
        return segmentedView
    }()
    
    lazy var pageScrollView: GKPageScrollView = {
        let pageScrollView = GKPageScrollView(delegate: self)
        pageScrollView.isLazyLoadList = true
        
        return pageScrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
        
        dataSource.titles = ["邀请中", "已完成"]
        segmentedView.defaultSelectedIndex = 1
        segmentedView.reloadData()
        pageScrollView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        addSubview(pageScrollView)
        pageScrollView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
}

extension GKPageListContainerView: JXSegmentedViewListContainer {}

extension GKPageView: GKPageScrollViewDelegate {
    func headerView(in pageScrollView: GKPageScrollView) -> UIView {
        headerView
    }
    
    func segmentedView(in pageScrollView: GKPageScrollView) -> UIView {
        segmentedView
    }
    
    func numberOfLists(in pageScrollView: GKPageScrollView) -> Int {
        dataSource.titles.count
    }
    
    func pageScrollView(_ pageScrollView: GKPageScrollView, initListAtIndex index: Int) -> GKPageListViewDelegate {
        CustomListView()
    }
}

class CustomListView: UIView {
    var scrollCallback: ((UIScrollView) -> ())?
}

extension CustomListView: GKPageListViewDelegate {
    func listView() -> UIView {
        let hostingController = UIHostingController(rootView: CustomSwiftUIView())
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hostingController.view)
        hostingController.view.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        return hostingController.view
    }

    func listScrollView() -> UIScrollView {
        // 返回内容视图所在的滚动视图
        UIScrollView()
    }

    func listViewDidScroll(callBack: @escaping (UIScrollView) -> ()) {
        // 处理滚动回调
        scrollCallback = callBack
    }
}
