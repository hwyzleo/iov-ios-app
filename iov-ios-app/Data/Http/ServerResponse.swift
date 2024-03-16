//
//  ServerResponse.swift
//  iov-app
//
//  Created by 叶荣杰 on 2023/6/13.
//



/*
 * 通用列表数据实体
 */
struct DataList<Model: Codable>: Codable {
    let total: Int
    var records: [Model]
    let page: Int
    let pageSize: Int
}
