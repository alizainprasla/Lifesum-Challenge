//
//  FoodInfoUseCase.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 24/11/2022.
//

import RxSwift

public protocol FoodInfoUseCase {
    func getInfo(by foodId: String) -> Single<FoodInfo>
}


struct RemoteFoodInfoUseCase: FoodInfoUseCase {

    var client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }
    func getInfo(by foodId: String) -> Single<FoodInfo> {
        guard let url =  URL(string: "https://api.lifesum.com/v2/foodipedia/codetest?foodid=\(foodId)") else {
            fatalError()
        }

        let request = URLRequest(url: url)

        return Single.create { single in
            client.load(request) { result in
                switch result {
                case let .success((data, _)):
                    do {
                        let mapper = try FoodInfoMapper.map(data: data)
                        single(.success(mapper.response!))
                    }
                    catch {
                        single(.failure(error))
                    }
                    break
                case let .failure(error):
                    single(.failure(error))
                    break
                }
            }
            return Disposables.create()
        }
    }
}
