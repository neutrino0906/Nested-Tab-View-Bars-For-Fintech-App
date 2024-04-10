//
//  InitialViewController.swift
//  demoApp
//
//  Created by Ground 2 on 09/04/24.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet var customTabBar: UIStackView!
    @IBOutlet var screen1: UIView!
    @IBOutlet var screen2: UIView!
    @IBOutlet var screen3: UIView!
    @IBOutlet var screen4: UIView!
    
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    let currTab = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customTabBar.addArrangedSubview(screen1)
        customTabBar.addArrangedSubview(screen2)
        customTabBar.addArrangedSubview(screen3)
        customTabBar.addArrangedSubview(screen4)
        
        customTabBar.distribution = .fillEqually
        
        setupCustomTabBar()
        setupTapGesturesForTabBar()
        
        guard let controller = UIStoryboard(name: "InitialTabBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "Screen1ViewController") as? Screen1ViewController
        else {return}
        
        presentViewController(controller: controller)
        
        changeViewTint(screen1, .red)
    }
    
    
    
    func setupCustomTabBar(){
        customTabBar.removeFromSuperview()
        
        
        customTabBar.distribution = .fillEqually
        
        customTabBar.frame = CGRect(x: view.frame.width * 0.05, y: view.frame.height - 100, width: view.frame.width, height: 100)
        view.addSubview(customTabBar)
        
        setDividerLine(at: view.frame.height-customTabBar.frame.height-1)
    }
    
    func setDividerLine(at y: CGFloat){
        let divider = UIView()
        divider.backgroundColor = .lightGray
        divider.frame = CGRect(x: 0, y: y, width: view.frame.width, height: 1)
        view.addSubview(divider)
    }
    
    func setupTapGesturesForTabBar(){
        screen1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnScreen1)))
        
        screen2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnScreen2)))
        
        screen3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnScreen3)))
        
        screen4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnScreen4)))
    }
    
    @objc func handleTapOnScreen1(gesture: UITapGestureRecognizer){
        guard let controller = UIStoryboard(name: "InitialTabBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "Screen1ViewController") as? Screen1ViewController
        else {return}
        
        presentViewController(controller: controller)
        
        changeViewTint(screen1, .red)
        changeViewTint(screen2, .black)
        changeViewTint(screen3, .black)
        changeViewTint(screen4, .black)
    }
    
    @objc func handleTapOnScreen2(gesture: UITapGestureRecognizer){
        guard let controller = UIStoryboard(name: "InitialTabBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "Screen2ViewController") as? Screen2ViewController
        else {return}
        
        presentViewController(controller: controller)
        
        
        changeViewTint(screen1, .black)
        changeViewTint(screen2, .red)
        changeViewTint(screen3, .black)
        changeViewTint(screen4, .black)
    }
    
    @objc func handleTapOnScreen3(gesture: UITapGestureRecognizer){
        guard let controller = UIStoryboard(name: "InitialTabBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "Screen3ViewController") as? Screen3ViewController
        else {return}
        
        presentViewController(controller: controller)
        
        changeViewTint(screen1, .black)
        changeViewTint(screen2, .black)
        changeViewTint(screen3, .red)
        changeViewTint(screen4, .black)
    }
    
    @objc func handleTapOnScreen4(gesture: UITapGestureRecognizer){
        guard let controller = UIStoryboard(name: "InitialTabBarViewControllers", bundle: nil).instantiateViewController(withIdentifier: "Screen4ViewController") as? Screen4ViewController
        else {return}
        
        presentViewController(controller: controller)
        
        changeViewTint(screen1, .black)
        changeViewTint(screen2, .black)
        changeViewTint(screen3, .black)
        changeViewTint(screen4, .red)
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
        controller.view.frame = CGRect(x: 0, y: statusBarHeight, width: view.frame.width, height: view.frame.height - 200)
    }
    


}
