//
//  ViewControllerExtensions.swift
//  demoApp
//
//  Created by Ground 2 on 08/04/24.
//

import Foundation
import UIKit

extension MainViewController {
    
    func setupFirstInitialization(){
        guard let dashboardViewController = UIStoryboard(name: "FooterNavigationBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
        else {return}
        
        addChild(dashboardViewController)
        view.addSubview(dashboardViewController.view)
        dashboardViewController.didMove(toParent: self)
        dashboardViewController.view.frame = CGRect(x: 0, y: statusBarHeight + CGFloat(48), width: view.frame.width, height: view.frame.height - 200)
        
        changeViewTint(navigationBarFooterDashboard, .red)
        changeViewTint(navigationBarFooterPortfolio, .black)
        changeViewTint(navigationBarFooterTransactions, .black)
        changeViewTint(navigationBarFooterMenu, .black)
    }
    
    
    func setupCustomNavigationFooter(){
        stackViewNavigationBarFooter.removeFromSuperview()
        
        stackViewNavigationBarFooter.addArrangedSubview(navigationBarFooterDashboard)
        stackViewNavigationBarFooter.addArrangedSubview(navigationBarFooterPortfolio)
        stackViewNavigationBarFooter.addArrangedSubview(navigationBarFooterTransactions)
        stackViewNavigationBarFooter.addArrangedSubview(navigationBarFooterMenu)
        
        stackViewNavigationBarFooter.distribution = .fillEqually
        
        stackViewNavigationBarFooter.frame = CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width+(view.frame.width * 0.1), height: 100)
        view.addSubview(stackViewNavigationBarFooter)
        
        setDividerLine(at: view.frame.height-stackViewNavigationBarFooter.frame.height-1)
        setDividerLine(at: statusBarHeight + navigationBar.frame.height)
        
        
//        let customFooterNavigationBar : UIView = {
//
//
//
//             let stackView = UIStackView(arrangedSubviews: [navigationBarFooterDashboard, navigationBarFooterPortfolio, navigationBarFooterTransactions,navigationBarFooterMenu])
//            stackView.distribution = .fillEqually
//            stackView.alignment = .center
//
//
//            return stackView
//
//        }()
        
//        let customFooterNavigationBar = UIStackView(arrangedSubviews: [navigationBarFooterDashboard, navigationBarFooterPortfolio, navigationBarFooterTransactions,navigationBarFooterMenu])
//        
//        customFooterNavigationBar.distribution = .fillEqually
//        customFooterNavigationBar.alignment = .center
//       return stackView
//        customFooterNavigationBar.backgroundColor = .white
//        customFooterNavigationBar.layer.shadowRadius = 10
//        customFooterNavigationBar.layer.shadowOpacity = 1
//        customFooterNavigationBar.layer.shadowColor = UIColor.black.cgColor
//        customFooterNavigationBar.frame = CGRect(x: view.frame.width * 0.05, y: self.view.frame.height - 100, width: view.frame.width, height: 48)
//        self.view.addSubview(customFooterNavigationBar)
    }
    
    func setupTapListenerForNavigationBarFooter(){
        navigationBarFooterDashboard.isUserInteractionEnabled = true
        
        
        navigationBarFooterDashboard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDashboardTap)))
        
        navigationBarFooterPortfolio.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlePortfolioTap)))
        
        navigationBarFooterTransactions.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTransactionsTap)))
        
        navigationBarFooterMenu.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMenuTap)))
    }
    
    @objc func handleDashboardTap(gesture: UITapGestureRecognizer){
        guard let dashboardViewController = UIStoryboard(name: "FooterNavigationBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
        else {return}
        
        addChild(dashboardViewController)
        view.addSubview(dashboardViewController.view)
        dashboardViewController.didMove(toParent: self)
        dashboardViewController.view.frame = CGRect(x: 0, y: statusBarHeight + CGFloat(50), width: view.frame.width, height: view.frame.height - footerNavigationBarViewContainer.frame.height)
        
        changeViewTint(navigationBarFooterDashboard, .red)
        changeViewTint(navigationBarFooterPortfolio, .black)
        changeViewTint(navigationBarFooterTransactions, .black)
        changeViewTint(navigationBarFooterMenu, .black)
        
        setupCustomNavigationFooter()
        
        
    }
    
    @objc func handlePortfolioTap(gesture: UITapGestureRecognizer){
        guard let portfolioViewController = UIStoryboard(name: "FooterNavigationBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "PortfolioViewController") as? PortfolioViewController
        else {return}
                
        addChild(portfolioViewController)
        view.addSubview(portfolioViewController.view)
        portfolioViewController.didMove(toParent: self)
        portfolioViewController.view.frame = CGRect(x: 0, y: statusBarHeight + CGFloat(50), width: view.frame.width, height: view.frame.height - 200)
        
        
        changeViewTint(navigationBarFooterDashboard, .black)
        changeViewTint(navigationBarFooterPortfolio, .red)
        changeViewTint(navigationBarFooterTransactions, .black)
        changeViewTint(navigationBarFooterMenu, .black)
        
        setupCustomNavigationFooter()
    }
    
    @objc func handleTransactionsTap(gesture: UITapGestureRecognizer){
        guard let transactionViewController = UIStoryboard(name: "FooterNavigationBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as? TransactionsViewController
        else {return}
                
        addChild(transactionViewController)
        view.addSubview(transactionViewController.view)
        transactionViewController.didMove(toParent: self)
        transactionViewController.view.frame = CGRect(x: 0, y: statusBarHeight + CGFloat(50), width: view.frame.width, height: view.frame.height - 200)
        
        
        
        changeViewTint(navigationBarFooterDashboard, .black)
        changeViewTint(navigationBarFooterPortfolio, .black)
        changeViewTint(navigationBarFooterTransactions, .red)
        changeViewTint(navigationBarFooterMenu, .black)
        
        setupCustomNavigationFooter()
    }
    
    @objc func handleMenuTap(gesture: UITapGestureRecognizer){
        
        guard let menuViewController = UIStoryboard(name: "FooterNavigationBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        else {return}
                
        addChild(menuViewController)
        view.addSubview(menuViewController.view)
        menuViewController.didMove(toParent: self)
        menuViewController.view.frame = CGRect(x: 0, y: statusBarHeight + CGFloat(50), width: view.frame.width, height: view.frame.height - 200)
        
        
        changeViewTint(navigationBarFooterDashboard, .black)
        changeViewTint(navigationBarFooterPortfolio, .black)
        changeViewTint(navigationBarFooterTransactions, .black)
        changeViewTint(navigationBarFooterMenu, .red)
        
        setupCustomNavigationFooter()
    }
    
    func changeViewTint(_ View: UIView, _ color: UIColor){
        for subview in View.subviews{
            if let label = subview as? UILabel{
                label.textColor = color
            }
            
            subview.tintColor = color
        }
    }
    
    
}
