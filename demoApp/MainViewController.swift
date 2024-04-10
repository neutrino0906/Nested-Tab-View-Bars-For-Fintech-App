//
//  ViewController.swift
//  demoApp
//
//  Created by Ground 2 on 08/04/24.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet var navigationBar: UIView!
    @IBOutlet var navigationBarFooterDashboard: UIView!
    @IBOutlet var navigationBarFooterPortfolio: UIView!
    @IBOutlet var navigationBarFooterTransactions: UIView!
    @IBOutlet var navigationBarFooterMenu: UIView!
    @IBOutlet var stackViewNavigationBarFooter: UIStackView!
    
    let footerNavigationBarViewContainer = UIView()
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.frame = CGRect(x: 0, y: statusBarHeight, width: view.frame.width, height: 48)
        view.addSubview(navigationBar)
        
        setupTapListenerForNavigationBarFooter()
        
        
        
        setupFirstInitialization()
        
        setupCustomNavigationFooter()
        
    }
    
    func setDividerLine(at y: CGFloat){
        let divider = UIView()
        divider.backgroundColor = .lightGray
        divider.frame = CGRect(x: 0, y: y, width: view.frame.width, height: 1)
        view.addSubview(divider)
    }
    
    


}

