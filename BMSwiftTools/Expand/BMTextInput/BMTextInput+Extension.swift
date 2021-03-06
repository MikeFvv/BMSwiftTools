//
//  BMTextInput+Extension.swift
//  BMSwiftTools
//
//  Created by BLOM on 5/9/22.
//

import Foundation

extension String {
    
    /// 移除emoji
    public func text_removeEmoji() -> String {
        let pattern = "[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]"
        return self.text_pregReplace(pattern: pattern, with: "")
    }
    
    /// 返回字数
    public var text_count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    /// 使用正则表达式替换
    public func text_pregReplace(pattern: String, with: String,
                          options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: NSMakeRange(0, self.text_count),
                                              withTemplate: with)
    }
}
