//
//  Program.swift
//  FitnessApp
//
//  Created by user on 28.01.2024.
//

import Foundation

struct Program {
    let title: String
    let days: [Day]
}

struct Day {
    let sets: [(Set, Int)]
}

struct Set {
    let exercises: [Exercise]
}

struct Exercise {
    let name: String
    let description: String
}

struct Mock {
    
    static let mockPrograms = [
        Program(title: "Фулбоди", days: [Day(sets: [(Set(exercises: [Exercise(name: "Подтягивания", description: "10 раз"), Exercise(name: "Отжимания", description: "20 раз")]), 2), (Set(exercises: [Exercise(name: "Пресс", description: "1 минута"), Exercise(name: "Спина", description: "20 раз")]), 1)]), Day(sets: [(Set(exercises: [Exercise(name: "епуапук", description: "10 раз"), Exercise(name: "куцпкцпц", description: "20 раз")]), 3), (Set(exercises: [Exercise(name: "кцпук", description: "1 минута"), Exercise(name: "куцпукп", description: "20 раз")]), 1)])]),
        Program(title: "Руки", days: [Day(sets: [(Set(exercises: [Exercise(name: "Фокусы", description: "10 попугаев")]), 5)])]),
        Program(title: "Ноги", days: [Day(sets: [(Set(exercises: [Exercise(name: "Штанга", description: "8 раз")]), 3)])]),
        Program(title: "Кардио", days: [Day(sets: [(Set(exercises: [Exercise(name: "Jumping Jacks", description: "20 раз")]), 2)])]),
    ]
}
