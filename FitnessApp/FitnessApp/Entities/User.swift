//
//  User.swift
//  FitnessApp
//
//  Created by user on 29.01.2024.
//

import Foundation

struct User {
    let info: String
    let timetable: Timetable
}

struct Timetable {
    let days: [[Today]]
}

struct Today {
    let dayOfProgram: (Program, Int)
}

struct MockTimetable {
    
    static let mockTimetable = Timetable(days: [
        [Today(dayOfProgram: (Mock.mockPrograms[0], 0)), Today(dayOfProgram: (Mock.mockPrograms[1], 0))],
        [],
        [Today(dayOfProgram: (Mock.mockPrograms[2], 0))],
        [Today(dayOfProgram: (Mock.mockPrograms[0], 1))],
        [],
        [],
        []
    ])
}
