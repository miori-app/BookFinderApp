//
//  FindBookNetwork.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import RxSwift
import Foundation

class FindBookNetwork {
    private let session : URLSession
    let api = APIModel()
    
    init(session : URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - 통신을 하고 파싱까지 하는 함수 구현
    // Network 는 주로 성공/ 실패 -> single

    func searchNetwork(query : SearchQuery) -> Single<Result<GoogleBooksResponseModel, NetworkErrorModel>> {
        
        guard let url = api.searchBooks(query: query).url else {
            return .just(.failure(.badURL))
        }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = HttpMethods.get
        
        return session.rx.data(request: request as URLRequest)
            .map { data in
                //json decoding
                do {
                    let bookResult = try JSONDecoder().decode(GoogleBooksResponseModel.self, from: data)
                    return .success(bookResult)
                } catch {
                    return .failure(.cannotParseResponse)
                }
            }
            .catch { _ in
                .just(.failure(.cannotParseResponse))
            }
            .asSingle()
    }
}

