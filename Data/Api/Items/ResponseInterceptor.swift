//
//  ResponseInterceptor.swift
//  Data
//
//  Created by Atsushi Miyake on 2019/02/09.
//  Copyright © 2019年 Atsushi Miyake. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Extension

protocol ResponseInterceptor {
    func intercept<T>(response: Response) -> Observable<T>? where T: Decodable
}

final class SuccessResponseInterceptor: ResponseInterceptor {
    
    static let shared = SuccessResponseInterceptor()
    private init() {}
    
    func intercept<T>(response: Response) -> Observable<T>? where T : Decodable {
        switch response.statusCode {
        case 200...226:
            do {
                let decoded = try response.map(T.self, using: .snakeCaseDecoder)
                return .just(decoded)
            } catch {
                return .error(PracticeError.jsonDecodeError(error: error))
            }
        default: return nil
        }
    }
}
