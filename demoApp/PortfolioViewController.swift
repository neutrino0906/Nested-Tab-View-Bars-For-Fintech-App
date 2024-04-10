//
//  PortfolioViewController.swift
//  demoApp
//
//  Created by Ground 2 on 08/04/24.
//

import UIKit

class PortfolioViewController: UIViewController {
    
    @IBOutlet var mutualFundView: UIView!
    @IBOutlet var shareBondView: UIView!
    @IBOutlet var fixedDeposits: UIView!
    @IBOutlet var otherAssets: UIView!
    
    static var currTab = 0
    
    lazy var headerTabBar = UIStackView(arrangedSubviews: [mutualFundView, shareBondView, fixedDeposits, otherAssets])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerTabBar.distribution = .fillEqually
        
        headerTabBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 72)
        
        view.addSubview(headerTabBar)
        
        setupTapGesturesForHeaderTabBar()
        setupCurrentTab()
        
    }
    
    func setupCurrentTab(){
        switch PortfolioViewController.currTab{
        case 0:
            changeViewTint(mutualFundView, .red)
            
            guard let controller = UIStoryboard(name: "PortfolioViewControllers", bundle: nil).instantiateViewController(withIdentifier: "MutualFundViewController") as? MutualFundViewController
            else {return}
            controller.view.backgroundColor = .red
            presentViewController(controller: controller)
        case 1:
            changeViewTint(shareBondView, .red)
            
            guard let controller = UIStoryboard(name: "PortfolioViewControllers", bundle: nil).instantiateViewController(withIdentifier: "ShareBondViewController") as? ShareBondViewController
            else {return}
            controller.view.backgroundColor = .brown
            presentViewController(controller: controller)
        case 2:
            changeViewTint(fixedDeposits, .red)
            
            guard let controller = UIStoryboard(name: "PortfolioViewControllers", bundle: nil).instantiateViewController(withIdentifier: "FixedDepositsViewController") as? FixedDepositsViewController
            else {return}
            controller.view.backgroundColor = .blue
            presentViewController(controller: controller)
        default:
            changeViewTint(otherAssets, .red)
            
            guard let controller = UIStoryboard(name: "PortfolioViewControllers", bundle: nil).instantiateViewController(withIdentifier: "OtherAssetsViewController") as? OtherAssetsViewController
            else {return}
            controller.view.backgroundColor = .cyan
            presentViewController(controller: controller)
        }
    }
    
    func setupTapGesturesForHeaderTabBar(){
        mutualFundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMutualFundTap)))
        
        shareBondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShareBondTap)))
        
        fixedDeposits.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFixedDepositsTap)))
                                                                   
        otherAssets.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleOtherAssetsTap)))
    }
                                                                
    @objc func handleMutualFundTap(){
        PortfolioViewController.currTab = 0
        guard let controller = UIStoryboard(name: "PortfolioViewControllers", bundle: nil).instantiateViewController(withIdentifier: "MutualFundViewController") as? MutualFundViewController
        else {return}
        controller.view.backgroundColor = .red
        presentViewController(controller: controller)
        
        changeViewTint(mutualFundView, .red)
        changeViewTint(shareBondView, .black)
        changeViewTint(fixedDeposits, .black)
        changeViewTint(otherAssets, .black)
        
    }
    
    @objc func handleShareBondTap(){
        PortfolioViewController.currTab = 1
        guard let controller = UIStoryboard(name: "PortfolioViewControllers", bundle: nil).instantiateViewController(withIdentifier: "ShareBondViewController") as? ShareBondViewController
        else {return}
        controller.view.backgroundColor = .brown
        presentViewController(controller: controller)
        
        changeViewTint(mutualFundView, .black)
        changeViewTint(shareBondView, .red)
        changeViewTint(fixedDeposits, .black)
        changeViewTint(otherAssets, .black)
    }
    
    @objc func handleFixedDepositsTap(){
        PortfolioViewController.currTab = 2
        guard let controller = UIStoryboard(name: "PortfolioViewControllers", bundle: nil).instantiateViewController(withIdentifier: "FixedDepositsViewController") as? FixedDepositsViewController
        else {return}
        controller.view.backgroundColor = .blue
        presentViewController(controller: controller)
        
        changeViewTint(mutualFundView, .black)
        changeViewTint(shareBondView, .black)
        changeViewTint(fixedDeposits, .red)
        changeViewTint(otherAssets, .black)
    }
    
    @objc func handleOtherAssetsTap(){
        PortfolioViewController.currTab = 3
        guard let controller = UIStoryboard(name: "PortfolioViewControllers", bundle: nil).instantiateViewController(withIdentifier: "OtherAssetsViewController") as? OtherAssetsViewController
        else {return}
        controller.view.backgroundColor = .cyan
        presentViewController(controller: controller)
        
        changeViewTint(mutualFundView, .black)
        changeViewTint(shareBondView, .black)
        changeViewTint(fixedDeposits, .black)
        changeViewTint(otherAssets, .red)
    }
    
    func changeViewTint(_ View: UIView, _ color: UIColor){
        for subview in View.subviews{
            if let label = subview as? UILabel{
                label.textColor = color
            }
            
            subview.tintColor = color
        }
    }
    
    func presentViewController(controller: UIViewController){
        
                
        addChild(controller)
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
        controller.view.frame = CGRect(x: 0, y: headerTabBar.frame.height, width: view.frame.width, height: view.frame.height - 100)
    }
    

}
