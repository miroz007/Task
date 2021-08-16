//
//  ViewController.swift
//  Salam-tech User
//
//  Created by islam on 2/4/20.
//  Copyright © 2020 islam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NVActivityIndicatorView


class BaseViewController: UIViewController , NVActivityIndicatorViewable{
    
    let disposeBag = DisposeBag()
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        }
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func setupUI()  {
    }
    
    
    func loading()
    {
        let xColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        startAnimating(.init(width: 50, height: 50), message: nil, messageFont: nil, type: .ballRotateChase, color: xColor, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: .clear, textColor: nil, fadeInAnimation: nil)
    }
    
    func killLoading(){
        stopAnimating()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        plog("deinit VC:\(self)")
    }
    
    func dismissNav(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissVC(_ sender:UIButton)
    {
        if let _ = self.navigationController {
            self.navigationController?.popViewController(animated: true)
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
