//
//  ViewController.swift
//  UseUIViewLikeCell
//
//  Created by Boss on 3/24/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

enum IndexView {
    case page0
    case page1
    case page2
    case page3
}

enum LoaiView {
    case view0
    case view1
    case view2
    case view3
}

class ViewController: UIViewController, PageView0Delegate {
    func delegateFromPageView0() {
        
    }
    
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var arrayButtons: [UIButton]!
    
    // UIView
    lazy var pageView0: UIView = {
        let pageView0: PageView0 = PageView0.loadFromNib()
        pageView0.delegate = self
        pageView0.frame = self.contentView.bounds
        self.contentView.addSubview(pageView0)
        return pageView0
    }()
    
    lazy var pageView1: UIView = {
        let pageView1: PageView1 = PageView1.loadFromNib()
        pageView1.delegate = self
//        pageView1.frame = self.contentView.bounds
        pageView1.bounds = self.contentView.bounds
        self.contentView.addSubview(pageView1)
        return pageView1
    }()
    
    lazy var pageView2: UIView = {
        let pageView2: PageView2 = PageView2.loadFromNib()
        pageView2.delegate = self
        pageView2.frame = self.contentView.bounds
        self.contentView.addSubview(pageView2)
        return pageView1
    }()
    
    lazy var pageView3: UIView = {
        let pageView3: PageView3 = PageView3.loadFromNib()
        pageView3.delegate = self
        pageView3.frame = self.contentView.bounds
        self.contentView.addSubview(pageView3)
        return pageView3
    }()
    
    lazy var pageTest: UIView = {
        let pageView3: PageTest = PageTest.loadFromNib()
        pageView3.delegate = self
        pageView3.frame = self.contentView.bounds
        self.contentView.addSubview(pageView3)
        return pageView3
    }()
    
    lazy var pageVT: UIView = {
        let pageView3: PageVT = PageVT.loadFromNib()
        pageView3.delegate = self
        pageView3.frame = self.contentView.bounds
        self.contentView.addSubview(pageView3)
        return pageView3
    }()
    
    // index of page view
    var currentIndexView: IndexView = .page0 {
        didSet {
            switch currentIndexView {
            case .page0:
                pageVT.isHidden = false
                pageView1.isHidden = true
                pageView2.isHidden = true
                pageView3.isHidden = true

            case .page1:
                pageView1.isHidden = false
                
                pageView0.isHidden = true
                pageView2.isHidden = true
                pageView3.isHidden = true
                pageVT.isHidden = true
                pageTest.isHidden = true

                
                
//                pageView3.isHidden = true

            case .page2:
                pageView2.isHidden = true

                pageView0.isHidden = true
                pageView1.isHidden = true
                pageView3.isHidden = true
                pageVT.isHidden = true
                pageTest.isHidden = false
                
            case .page3:
                pageView3.isHidden = false

                pageView0.isHidden = true
                pageView1.isHidden = true
                pageView2.isHidden = true
                pageVT.isHidden = true
                pageTest.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        currentIndexView = .page3
        createView(.view0)
    }
    var loaiView = LoaiView.view0
    
    func createView(_ loaiView: LoaiView) {
        var firstView = UIView()
        switch loaiView {
        case .view0:
            firstView = PageView0.loadFromNib()
        case .view1:
            firstView = PageView1.loadFromNib()
        case .view2:
            firstView = PageView2.loadFromNib()
        case .view3:
            firstView = PageView3.loadFromNib()
        }
        firstView.frame = contentView.bounds
        contentView.addSubview(firstView)
    }
    
    var indexView = IndexView.page0
    override func viewDidLayoutSubviews() {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            
//            switch self.indexView {
//            case .page0:
//                self.currentIndexView = .page0
//                self.indexView = .page1
//            case .page1:
//                self.currentIndexView = .page1
//                self.indexView = .page2
//            case .page2:
//                self.currentIndexView = .page2
//                self.indexView = .page3
//            case .page3:
//                self.currentIndexView = .page3
//                self.indexView = .page0
//            }
//        }
    }

    @IBAction func tappedChangedPage(_ sender: UIButton) {
        for item in arrayButtons {
            let index = arrayButtons.index(of: item)
            if index == sender.tag {
                item.backgroundColor = .green
            } else {
                item.backgroundColor = .white
            }
        }
        
        switch sender.tag {
        case 0:
            createView(.view0)
        case 1:
            createView(.view1)
        case 2:
            createView(.view2)
        default:
            createView(.view3)
        }
        
    }
    
}

