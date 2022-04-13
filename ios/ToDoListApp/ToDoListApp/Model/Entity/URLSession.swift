//
//  Network.swift
//  ToDoListApp
//
//  Created by Jihee hwang on 2022/04/12.
//

import Foundation


struct NetWork {
    private func requestGet(url: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        let dummy = "http://3.39.127.191:8080/list"

        // 1. 세션 구성 생성
        let configuration = URLSessionConfiguration.default
        // 2.  cellular 네트워크 비허용 및 구성을 기반으로 세션 생성
        configuration.waitsForConnectivity = true
        let session = URLSession(configuration: configuration)

        // JSON을 가져와 데이터를 처력하는 작업을 처리하기 위해, String을 전달하는 URL 객체 생성
        guard let url = URL(string: dummy) else { fatalError() }

        // Reqeust 생성
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.description

        // 테스크 구성
        URLSession.shared.dataTask(with: request) { data, response, error in
            // 유효한 응답을 하는지 확인
            guard let httpResponse = response as? HTTPURLResponse, (200...299) ~= httpResponse.statusCode else {
                fatalError("Error: HTTP request failed") // 먼저 유효한 응답을 수신했는지 확인
            }
            guard let data = data else {
                fatalError(error.debugDescription) // 유효한 데이터를 수신했는지 확인
            }
            guard error == nil else {
                fatalError("Error - error calling GET") // 호출이 정상적으로 이루어졌는지 확인
            }
            completionHandler(.success(data))
            
            // 위에서 수신된 응답한 데이터를 가지고 String 타입으로 변환 후 출력
//            if let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? { print(result) }
            
        }.resume()
    }
}
