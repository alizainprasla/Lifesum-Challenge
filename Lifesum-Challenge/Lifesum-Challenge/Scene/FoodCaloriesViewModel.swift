//
//  FoodCaloriesViewModel.swift
//  Lifesum-Challenge
//
//  Created by Alizain on 24/11/2022.
//

import RxSwift
import RxCocoa

public struct FoodCaloriesViewModel {

    var foodInfoUseCase: FoodInfoUseCase

    init(foodInfoUseCase: FoodInfoUseCase){
        self.foodInfoUseCase = foodInfoUseCase
    }
    struct Input {
        let loadMoreInfo: Observable<Void>
    }

    struct Output {
        let data: Driver<FoodInfo?>
        let fetching: Driver<Bool>
        let error: Driver<Error>
    }

    private let disposeBag = DisposeBag()

    func transform(input: Input) -> Output? {
        let foodinfo = BehaviorRelay<FoodInfo?>(value: nil)

        let activityTracker = ActivityIndicator()

        let errorTracker = ErrorTracker()

        input.loadMoreInfo
            .flatMapLatest {
                foodInfoUseCase.getInfo(by: "\(Int.random(in: 1..<200))")
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
            }
            .subscribe(onNext: { item in
                foodinfo.accept(item)
            })
            .disposed(by: disposeBag)

        return Output(data: foodinfo.asDriver(onErrorJustReturn: nil),
                      fetching: activityTracker.asDriver(),
                      error: errorTracker.asDriver())
    }
}
