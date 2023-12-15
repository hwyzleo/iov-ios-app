//
//  UserManager.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/12/13.
//

import SwiftyJSON
import RealmSwift
import RxSwift

@objcMembers
class User: Object {
    
    /// 用户令牌
    dynamic var token: String = ""
    /// 用户昵称
    dynamic var nickname: String = ""
    /// 用户头像
    dynamic var avatar: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.nickname = json["nickname"].stringValue
        self.avatar = json["avatar"].stringValue
    }
    
    /// 获取用户信息
    class func getUser() -> User? {
        return RealmManager.user.realm.objects(User.self).first
    }
    
    /// 获取测试用户信息
    class func getMockUser() -> User {
        let user = User()
        user.nickname = "hwyz_leo"
        return user
    }
    
    /// 是否登录
    class func isLogin() -> Bool {
        return getToken().isEmpty ? false : true
    }
    
    /// 是否有头像
    class func hasAvatar() -> Bool {
        return (getUser()?.avatar ?? "").isEmpty ? false : true
    }
    
    /// 获取令牌
    class func getToken() -> String {
        return getUser()?.token ?? ""
    }
    
    /// 创建用户信息
    @discardableResult
    class func create(user: User) -> Observable<User> {
        clear()
        let realm = RealmManager.user.realm
        do {
            try realm.write {
                realm.add(user)
            }
            return .just(user)
        } catch {
            return .error(error)
        }
    }
    
    /// 清除用户信息
    @discardableResult
    class func clear() -> Observable<Void> {
        let realm = RealmManager.user.realm
        do {
            try realm.write {
                realm.deleteAll()
                realm.refresh()
            }
            return .just(())
        } catch {
            return .error(error)
        }
    }
    
}
