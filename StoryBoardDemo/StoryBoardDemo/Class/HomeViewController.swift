//
//  HomeViewController.swift
//  StoryBoardDemo
//
//  Created by CityMedia on 2018/4/18.
//  Copyright © 2018年 CityMedia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnAction(_ sender: Any) {
        
    }
    func test(){ 
    }
    
    // storyboard 跳转 设计方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue Id : \(String(describing: segue.identifier))")
        if segue.identifier == "pushToDetail"{
            segue.source.hidesBottomBarWhenPushed = true
            
        }
    }
    
    // storyboard 返回 设计方法
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        print("unwind Id : \(sender.identifier ?? "unwind")")
        if sender.identifier == "backToHome"{
            
        }
    } 

    

}
