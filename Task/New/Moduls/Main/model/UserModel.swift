//
//  ConsultationModel.swift
//  Salamtech-Doctor
//
//  Created by Ahmed on 9/13/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import SwiftyJSON

class RootClass{

    var code : Int!
    var data : [Users]!
    var message : String!
    var success : Bool!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }

        code = json["Code"].intValue
        data = [Users]()
        let dataArray = json["Data"].arrayValue
        for dataJson in dataArray{
            let value = Users(fromJson: dataJson)
            data.append(value)
        }
        message = json["Message"].stringValue
        success = json["Success"].boolValue
    }

}


class Users{

    var accountID : Int!
    var activationCode : String!
    var asyncActionType : Int!
    var countryID : Int!
    var departmentID : Int!
    var departmentName : String!
    var email : String!
    var groupId : Int!
    var isActivated : Bool!
    var isAdmin : Bool!
    var isBusinessHead : Bool!
    var isDeleted : Bool!
    var isStaff : Bool!
    var isUnderCompany : Bool!
    var jobDescription : String!
    var jobTitle : String!
    var managerID : Int!
    var memberCode : String!
    var name : String!
    var phoneNumber : String!
    var profileImage : String!
    var userStateID : Int!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        accountID = json["AccountID"].intValue
        activationCode = json["ActivationCode"].stringValue
        asyncActionType = json["AsyncActionType"].intValue
        countryID = json["CountryID"].intValue
        departmentID = json["DepartmentID"].intValue
        departmentName = json["DepartmentName"].stringValue
        email = json["Email"].stringValue
        groupId = json["GroupId"].intValue
        isActivated = json["IsActivated"].boolValue
        isAdmin = json["IsAdmin"].boolValue
        isBusinessHead = json["IsBusinessHead"].boolValue
        isDeleted = json["IsDeleted"].boolValue
        isStaff = json["IsStaff"].boolValue
        isUnderCompany = json["IsUnderCompany"].boolValue
        jobDescription = json["JobDescription"].stringValue
        jobTitle = json["JobTitle"].stringValue
        managerID = json["ManagerID"].intValue
        memberCode = json["MemberCode"].stringValue
        name = json["Name"].stringValue
        phoneNumber = json["PhoneNumber"].stringValue
        profileImage = json["ProfileImage"].stringValue
        userStateID = json["UserStateID"].intValue
    }

}




