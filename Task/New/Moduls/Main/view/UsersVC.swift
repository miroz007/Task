//
//  ConsultationVC.swift
//  salamtech
//
//  Created by hesham ghalaab on 5/17/20.
//  Copyright © 2020 hesham ghalaab. All rights reserved.
//

import UIKit


class UsersVC: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    // MARK:-Properties
    var users : [Users]?
    var IDs:[Int] = []
    var viewModel = UsersViewModel()
    
    // MARK:-Override Functions
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        topView.clipsToBounds = true
        topView.layer.cornerRadius = 25
        topView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    
    // MARK:-Methods
    private func configuration(){
        viewModel.getCompanyUsers()
    }
    
    
    override func setupUI(){
        let nib = UINib(nibName: UserCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UserCell.identifier)
        
        viewModel.dataSource.configureCell = { (dataSource ,tableView ,indexPath ,item) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
            cell.configure(user: item)
            return cell
        }
        
        viewModel.dataSource.titleForHeaderInSection = { (dataSource,index) in
            let section = dataSource[index]
            return section.header
        }
        
        let userDataSource = viewModel.dataSource

        viewModel.users.asObservable()
            .map({[
        
                SectionViewModel(header:"Quality 21.", items: $0.filter({  $0.managerID == 4894 }))
                ,SectionViewModel(header:"Quality 101.", items: $0.filter({  $0.managerID == 5000 }))
                ,SectionViewModel(header:"Quality 70.", items: $0.filter({  $0.managerID == 5008 }))
                ,SectionViewModel(header:"Quality 80.", items: $0.filter({  $0.managerID == 5018 }))
                ,SectionViewModel(header:"Quality 161.", items: $0.filter({  $0.managerID == 5041 }))
                ,SectionViewModel(header:"Quality 86.", items: $0.filter({  $0.managerID == 5061 }))
                ,SectionViewModel(header:"Quality 66.", items: $0.filter({  $0.managerID == 5070 }))
                ,SectionViewModel(header:"Quality 55.", items: $0.filter({  $0.managerID == 5072 }))
                ,SectionViewModel(header:"Quality 87.", items: $0.filter({  $0.managerID == 5075 }))
                ,SectionViewModel(header:"CEO", items: $0.filter({  $0.managerID == 4888 }))
                
            ]})
            .bind(to: tableView.rx.items(dataSource: userDataSource))
            .disposed(by: disposeBag)
        
        
        viewModel.isLoading
            .distinctUntilChanged()
            .drive(onNext: { [weak self] (isLoading) in
                guard let `self` = self else { return }
                self.killLoading()
                if isLoading {
                    self.loading()
                }
            })
            .disposed(by: disposeBag)
    }
 
}



