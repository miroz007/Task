//
//  BaseViewModel.swift
//  ASCIOS
//
//  Created by islam on 2/19/20.
//  Copyright © 2020 islam. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    let alertDialog = PublishSubject<(String,String)>()
    let dependency:AppDependency

    init() {
        dependency = AppDependency(window: Application.window!)
    }
    
}
