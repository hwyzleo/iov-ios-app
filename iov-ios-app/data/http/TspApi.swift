//
//  TspApi.swift
//  iov-ios-app
//
//  Created by 叶荣杰 on 2023/7/9.
//

import Foundation
import UIKit

/// TSP接口
class TspApi {
    
    /// Mock状态
    static var isMock = true
    
    /// 发送手机号登录验证码
    static func sendMobileVerifyCode(countryRegionCode: String, mobile: String, completion: @escaping (Result<TspResponse<NoReply>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestPost(path: "/account/mp/login/sendVerifyCode", parameters: ["countryRegionCode": countryRegionCode, "mobile": mobile]) { (result: Result<TspResponse<NoReply>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion(.success(TspResponse.init(code: 0, ts: Int64(Date().timeIntervalSince1970*1000))))
            }
        }
    }
    
    /// 手机号验证码登录
    static func mobileVerifyCodeLogin(countryRegionCode: String, mobile: String, verifyCode: String, completion: @escaping (Result<TspResponse<LoginResponse>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestPost(path: "/account/mp/login/verifyCodeLogin", parameters: ["countryRegionCode": countryRegionCode, "mobile": mobile, "verifyCode": verifyCode]) { (result: Result<TspResponse<LoginResponse>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let res = LoginResponse.init(
                    mobile: "13000000000",
                    nickname: "hwyz_leo",
                    avatar: "https://iov-public-1253442587.cos.ap-shanghai.myqcloud.com/account-service/avatar-EqeOCSvUejtJlIiNcNGmo.jpeg",
                    token: "token12345678",
                    tokenExpires: Int64(Date().timeIntervalSince1970*1000+24*60*60*1000),
                    refreshToken: "refreshToken12345678",
                    refreshTokenExpires: Int64(Date().timeIntervalSince1970*1000+24*60*60*1000)
                )
                completion(.success(TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000), data: res)))
            }
        }
    }
    
    /// 获取账号信息
    static func getAccountInfo(completion: @escaping (Result<TspResponse<AccountInfo>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestGet(path: "/account/mp/account/info", parameters: [:]) { (result: Result<TspResponse<AccountInfo>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let data = AccountInfo.init(
                    mobile: "13917288107",
                    nickname: "hwyz_leo",
                    avatar: "https://iov-public-1253442587.cos.ap-shanghai.myqcloud.com/account-service/avatar-EqeOCSvUejtJlIiNcNGmo.jpeg",
                    gender: "MALE",
                    birthday: "1982-10-13"
                )
                let res = TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000), data: data)
                debugPrint("Mock API[getAccountInfo] Response:", res)
                completion(.success(res))
            }
        }
    }
    
    /// 生成头像预上传地址
    static func generateAvatarUrl(completion: @escaping (Result<TspResponse<PreSignedUrl>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestPost(path: "/account/mp/account/action/generateAvatarUrl", parameters: [:]) { (result: Result<TspResponse<PreSignedUrl>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let res = PreSignedUrl.init(
                    uploadUrl: "http://xxxxxx",
                    objectKey: "xxxx"
                )
                completion(.success(TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000), data: res)))
            }
        }
    }
    
    /// 修改头像
    static func modifyAvatar(imageUrl: String, completion: @escaping (Result<TspResponse<NoReply>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestPost(path: "/account/mp/account/action/modifyAvatar", parameters: ["avatar":imageUrl]) { (result: Result<TspResponse<NoReply>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion(.success(TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000))))
            }
        }
    }
    
    /// 修改昵称
    static func modifyNickname(nickname: String, completion: @escaping (Result<TspResponse<NoReply>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestPost(path: "/account/mp/account/action/modifyNickname", parameters: ["nickname": nickname]) { (result: Result<TspResponse<NoReply>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion(.success(TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000))))
            }
        }
    }
    
    /// 修改性别
    static func modifyGender(gender: String, completion: @escaping (Result<TspResponse<NoReply>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestPost(path: "/account/mp/account/action/modifyGender", parameters: ["gender": gender]) { (result: Result<TspResponse<NoReply>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion(.success(TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000))))
            }
        }
    }
    
    /// 修改生日
    static func modifyBirthday(birthday: String, completion: @escaping (Result<TspResponse<NoReply>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestPost(path: "/account/mp/account/action/modifyBirthday", parameters: ["birthday": birthday]) { (result: Result<TspResponse<NoReply>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let res = TspResponse<NoReply>(code: 0, ts: Int64(Date().timeIntervalSince1970*1000))
                debugPrint("Mock API[modifyBirthday] Response:", res)
                completion(.success(res))
            }
        }
    }
    
    /// 修改地区
    static func modifyArea(area: String, completion: @escaping (Result<TspResponse<NoReply>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestPost(path: "/account/mp/account/action/modifyArea", parameters: ["area": area]) { (result: Result<TspResponse<NoReply>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let res = TspResponse<NoReply>(code: 0, ts: Int64(Date().timeIntervalSince1970*1000))
                debugPrint("Mock API[modifyArea] Response:", res)
                completion(.success(res))
            }
        }
    }
    
    // 上传COS
    static func uploadCos(url: String, image: UIImage, objectKey: String, completion: @escaping (Result<String, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.uploadCos(url: url, image: image, parameters: ["key":objectKey]) { (result: Result<String, Error>) in
                completion(result)
            }
        }
    }
    
}
