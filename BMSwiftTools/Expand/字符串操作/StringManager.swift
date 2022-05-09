//
//  StringManager.swift
//  BMSwiftTools
//
//  Created by BLOM on 4/28/22.
//

import Foundation






/// 计算字符串中子字符串出现的次数
/// - Parameters:
///   - str: 字符串
///   - substr: 子字符串
/// - Returns: 数量
func subStringCount(str: String, substr: String) -> Int {
    { $0.isEmpty ? 0 : $0.count - 1 } ( str.components(separatedBy: substr))
}

//参考 https://stackoom.com/en/question/29Cdr


