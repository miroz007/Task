//
//  ConsultantViewModel.swift
//  Salamtech-User
//
//  Created by Korashi on 17/05/2021.
//  Copyright © 2021 Amir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON
import RxDataSources

struct SectionViewModel {
    var header: String
    var items : [Users]
}

extension SectionViewModel:AnimatableSectionModelType {
    typealias Identity = String
    
    var identity: String {
        return header
    }
    
    typealias Item = Users
    
    init(original: SectionViewModel, items: [Users]) {
        self = original
        self.items = items
    }

}

extension Users:IdentifiableType , Equatable{

    
    typealias Identity = String
    
    var identity: String {
        let id = "\(managerID ?? 0)"
        return id
    }
    
    
    static func == (lhs: Users, rhs: Users) -> Bool {
        let lid = "\(lhs.managerID ?? 0)"
        let rid = "\(rhs.managerID ?? 0)"

        return lid == rid
    }
}


class UsersViewModel: BaseViewModel {
    
    var dataSource = RxTableViewSectionedAnimatedDataSource<SectionViewModel>(configureCell: {(_,_,_,_) in
       fatalError()
    })
    
    let isLoading: ActivityIndicator =  ActivityIndicator()
    var users = BehaviorRelay<[Users]>(value: [])
    lazy var isData  = BehaviorRelay<Bool>(value: false)
    var id : String? = ""
    var managersID:Set<Int> = []
    var managersIDArray:[Int] = []
    func getCompanyUsers()
    {
        self.dependency.api.regularRequest(apiRouter: .getCompanyUsers)
            .trackActivity(isLoading)
            .observe(on: MainScheduler.asyncInstance)
            .subscribe {[weak self] (event) in
                guard let `self` = self else { return }
                switch event {
                case .next(let result):
                    switch result {
                    case .success(value: let response):
                        print(response)
                        let json = JSON(response as Any)
                        let data = RootClass(fromJson: json)
                        if let data = data.data {
                            self.users.accept(data)
                            self.handleResponse(arr: self.users.value)
                        }
                    case .failure(let error):
                        print(error)
                    }
                default:
                    break
                }
            }.disposed(by: disposeBag)
        
    }
    
    func handleResponse(arr:[Users]) {
        for i in arr {
            managersID.insert(i.managerID)
            managersIDArray = managersID.sorted()
        }
        print(managersIDArray)
    }
    
    
    
    
    
    
}
