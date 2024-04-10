//
//  Screen2ViewController.swift
//  demoApp
//
//  Created by Ground 2 on 09/04/24.
//

import UIKit

class Screen2ViewController: UIViewController {
    @IBAction func hopToClientButtonAction(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        else {
            return
        }
        
        self.parent?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
