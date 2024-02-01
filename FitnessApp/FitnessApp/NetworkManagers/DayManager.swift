//
//  DayManager.swift
//  FitnessApp
//
//  Created by user on 29.01.2024.
//

import Foundation

protocol DayManagerDescription {
    func getDay(closure: @escaping (Result<[Today], CustomError>) -> Void)
}

final class DayManager: DayManagerDescription {
    static let shared: DayManagerDescription = DayManager()

    private init() {}

    func getDay(closure: @escaping (Result<[Today], CustomError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let day = MockTimetable.mockTimetable.days[0]
            let result: Result<[Today], CustomError> = .success(day) // .failure(.unknownError)
            closure(result)
        }
    }
}
