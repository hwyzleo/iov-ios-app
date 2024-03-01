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
                    avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663",
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
                    avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663",
                    gender: "MALE",
                    birthday: "1982-10-13",
                    area: "上海 长宁"
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
    
    /// 获取内容块
    static func getContentBlock(channel: String, completion: @escaping (Result<TspResponse<Array<ContentBlock>>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestGet(path: "/account/mp/account/info", parameters: [:]) { (result: Result<TspResponse<Array<ContentBlock>>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                var data: [ContentBlock] = []
                var carousels: [BaseContent] = []
                carousels.append(BaseContent.init(id: "1", type: "article", title: "尽享雪地之美", intro: "", images: ["https://pic.imgdb.cn/item/65df049a9f345e8d031861c3.png"], ts: 1709114457603))
                carousels.append(BaseContent.init(id: "2", type: "", title: "露营最佳伴侣", intro: "", images: ["https://pic.imgdb.cn/item/65df12989f345e8d033afff7.png"], ts: 1709114457603))
                carousels.append(BaseContent.init(id: "3", type: "subject", title: "一张图了解开源汽车", intro: "", images: ["https://pic.imgdb.cn/item/65df13639f345e8d033d11fb.png"], ts: 1709114457603))
                carousels.append(BaseContent.init(id: "4", type: "", title: "霸气尽显", intro: "", images: ["https://pic.imgdb.cn/item/65df13699f345e8d033d24f6.png"], ts: 1709114457603))
                data.append(ContentBlock.init(id: "1", type: "carousel", data: carousels))
                var navigations: [BaseContent] = []
                navigations.append(BaseContent.init(id: "1", type: "topic", title: "最新活动", images: ["https://pic.imgdb.cn/item/65df202d9f345e8d03619d29.png"], ts: 1709121879408))
                navigations.append(BaseContent.init(id: "2", type: "article", title: "预约试驾", images: ["https://pic.imgdb.cn/item/65df254c9f345e8d0372105c.png"], ts: 1709122924212))
                navigations.append(BaseContent.init(id: "3", type: "subject", title: "产品解读", images: ["https://pic.imgdb.cn/item/65df27319f345e8d03780cb0.png"], ts: 1709123418329))
                data.append(ContentBlock.init(id: "2", type: "navigation", title: "产品解读", data: navigations))
                var article: [BaseContent] = []
                article.append(BaseContent.init(
                    id: "1", type: "", title: "开源汽车——旅途的最佳伴侣!",
                    intro: "趁春节假期，一家四口回了趟四川老家，途径乐山、石棉、泸定、康定、宜宾等地，总……",
                    images: [
                        "https://pic.imgdb.cn/item/65df360f9f345e8d03ae3131.png",
                        "https://pic.imgdb.cn/item/65e0201e9f345e8d03620461.png",
                        "https://pic.imgdb.cn/item/65df4e159f345e8d0301a944.png",
                        "https://pic.imgdb.cn/item/65df55069f345e8d0318a51c.png"
                    ],
                    ts: 1709124212841, username: "hwyz_leo",
                    avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663",
                    location: "万达广场",
                    commentCount: 3,
                    likeCount: 13
                ))
                data.append(ContentBlock.init(id: "3", type: "article", data: article))
                var topics: [BaseContent] = []
                topics.append(BaseContent.init(id: "1", type: "", title: "首批车主用车心声", images: ["https://pic.imgdb.cn/item/65e012a79f345e8d03444608.png"], ts: 1709182971760))
                topics.append(BaseContent.init(id: "2", type: "", title: "沉浸式露营", images: ["https://pic.imgdb.cn/item/65df12989f345e8d033afff7.png"], ts: 1709182971760))
                topics.append(BaseContent.init(id: "3", type: "", title: "内饰揭秘", images: ["https://pic.imgdb.cn/item/65df13639f345e8d033d11fb.png"], ts: 1709182971760))
                topics.append(BaseContent.init(id: "4", type: "", title: "城市穿越", images: ["https://pic.imgdb.cn/item/65df13699f345e8d033d24f6.png"], ts: 1709182971760))
                data.append(ContentBlock.init(id: "4", type: "topic", title: "北境之旅，开源出发", data: topics))
                let res = TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000), data: data)
                debugPrint("Mock API[getContentBlock] Response:", res)
                completion(.success(res))
            }
        }
    }
    
    /// 获取文章
    static func getArticle(id: String, completion: @escaping (Result<TspResponse<Article>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestGet(path: "/account/mp/account/info", parameters: [:]) { (result: Result<TspResponse<Article>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let data: Article = Article.init(
                    id: "1",
                    title: "旅途的最佳伴侣！",
                    content: "趁春节假期，一家四口回了趟四川老家，途经乐山、石棉、泸定、康定、宜宾等地，总行程1954公里。车的表现让我们非常满意，空间大，装载能力强，底盘扎实稳重，时速跑上120公里一点也不飘，特别是翻越折多山时，很多车都挂了防滑链，而我凭着四条AT胎，稳稳的行驶在冰雪路面，满满的安全感。车子的娱乐功能也值得表扬:看电影，听歌曲，唱卡拉OK，让旅途充满了无穷乐趣;增程式可油可电，毫无里程焦虑，说走就走让我觉得当初的选择是非常正确的!在今后的日子里，我们一起继续向山海出发!",
                    images: [
                        "https://pic.imgdb.cn/item/65df360f9f345e8d03ae3131.png",
                        "https://pic.imgdb.cn/item/65e0201e9f345e8d03620461.png",
                        "https://pic.imgdb.cn/item/65df4e159f345e8d0301a944.png",
                        "https://pic.imgdb.cn/item/65df55069f345e8d0318a51c.png"
                    ],
                    ts: 1709218491419,
                    username: "hwyz_leo",
                    avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663",
                    views: 20,
                    location: "重庆",
                    tags: ["发现家乡的美"],
                    comments: [
                        ArticleComment.init(id: "1", parentId: "1", comment: "拍的太好了！", ts: 1709261044490, username: "开源汽车爱好者", location: "江苏省"),
                        ArticleComment.init(id: "3", parentId: "1", comment: "感谢认可", replyer: "开源汽车爱好者", ts: 1709261044490, username: "hwyz_leo", avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663", location: "上海市"),
                        ArticleComment.init(id: "2", parentId: "2", comment: "这景色真美啊", ts: 1709261044490, username: "tina", location: "山东省")
                    ]
                )
                let res = TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000), data: data)
                debugPrint("Mock API[getArticle] Response:", res)
                completion(.success(res))
            }
        }
    }
    
    /// 获取话题
    static func getSubject(id: String, completion: @escaping (Result<TspResponse<Subject>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestGet(path: "/account/mp/account/info", parameters: [:]) { (result: Result<TspResponse<Subject>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let data: Subject = Subject.init(
                    id: "1",
                    title: "旅途的最佳伴侣！",
                    image: "https://pic.imgdb.cn/item/65df13699f345e8d033d24f6.png",
                    userCount: 23,
                    articleCount: 55,
                    defaultContent: [
                        BaseContent.init(id: "1", type: "article", title: "开启露营模式！", intro: "开着汽车，带着家人，帐篷打开，气炉点燃。热腾腾的粥，香喷喷的米饭。", images: [
                            "https://pic.imgdb.cn/item/65e17d2b9f345e8d038aab68.png",
                            "https://pic.imgdb.cn/item/65e17d549f345e8d038b84aa.png"
                        ], ts: 1709275436479, username: "夜月", location: "上海市"),
                        BaseContent.init(id: "2", type: "article", title: "燃行冬日，立即出发！", intro: "时光跌跌撞撞，季节来来往往", images: [
                            "https://pic.imgdb.cn/item/65df12989f345e8d033afff7.png"
                        ], ts: 1709275436479, username: "越野爱好者", location: "山东省")
                    ],
                    latestContent: [
                        BaseContent.init(id: "1", type: "article", title: "带我去看冬日的春意", intro: "第一次开着汽车带着家人走山道，选了一个好的不能再好的天气去附近的百花山露营", images: [
                            "https://pic.imgdb.cn/item/65e17e9a9f345e8d038f171a.png",
                            "https://pic.imgdb.cn/item/65e17ea99f345e8d038f3c9a.png"
                        ], ts: 1709275436479, username: "Alle22", location: "青海省"),
                        BaseContent.init(id: "2", type: "article", title: "黎族山区自驾", intro: "黎族山区", images: [
                            "https://pic.imgdb.cn/item/65df27319f345e8d03780cb0.png"
                        ], ts: 1709275436479, username: "旅游达人", location: "河南省")
                    ]
                )
                let res = TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000), data: data)
                debugPrint("Mock API[getSubject] Response:", res)
                completion(.success(res))
            }
        }
    }
    
    /// 获取专题
    static func getTopic(id: String, completion: @escaping (Result<TspResponse<Topic>, Error>) -> Void) {
        if(!isMock) {
            BaseAPI.requestGet(path: "/account/mp/account/info", parameters: [:]) { (result: Result<TspResponse<Topic>, Error>) in
                completion(result)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let data: Topic = Topic.init(
                    id: "1",
                    title: "产品解读",
                    image: "https://pic.imgdb.cn/item/65df4e159f345e8d0301a944.png",
                    contents: [
                        BaseContent.init(id: "1", type: "aritcle", title: "智能穿越助你探索山西", images: ["https://pic.imgdb.cn/item/65e012a79f345e8d03444608.png"], ts: 1709284625762, username: "hwyz_leo", avatar: "https://profile-photo.s3.cn-north-1.amazonaws.com.cn/files/avatar/50531/MTAxMDYzNDY0Nzd4d2h2cWFt/avatar.png?v=c4af49f3cbedbc00f76256a03298b663"),
                        BaseContent.init(id: "2", type: "aritcle", title: "户外露营生活新选择", images: ["https://pic.imgdb.cn/item/65df3bb89f345e8d03c2306c.png"], ts: 1709284625762, username: "山高第九"),
                        BaseContent.init(id: "3", type: "aritcle", title: "一键舒享的航空座椅", images: ["https://pic.imgdb.cn/item/65df13639f345e8d033d11fb.png"], ts: 1709284625762, username: "一起探索")
                    ]
                )
                let res = TspResponse(code: 0, ts: Int64(Date().timeIntervalSince1970*1000), data: data)
                debugPrint("Mock API[getTopic] Response:", res)
                completion(.success(res))
            }
        }
    }
    
}
