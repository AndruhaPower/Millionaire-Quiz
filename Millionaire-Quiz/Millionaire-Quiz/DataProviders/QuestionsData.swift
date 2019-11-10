//
//  QuestionsData.swift
//  Millionaire-Quiz
//
//  Created by Andrew on 11/11/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

final class QuestionData {

     static var questions: [Question] =
         [Question(question: "Какой элемент есть в конструкции башенного крана?"
             , answers: ["Стрела", "Копье", "Дротик", "Бумеранг"]
             , correctAnswer: "Стрела"),
          Question(question: "У каких животных шерсть растет в необычном направлении - от брюха к спине?"
             , answers: ["У панд", "У коал", "У ленивцев", "У кенгуру"]
             , correctAnswer: "У ленивцев"),
          Question(question: "В какой стране был построен ледокол Ермак?"
             , answers: ["Россия", "Великобритания", "Германия", "Нидерланды"]
             , correctAnswer: "Великобритания"),
          Question(question: "Как называют щелчок компьютерной мыши?"
             , answers: ["клац", "клик", "бумс", "дзынь"]
             , correctAnswer: "клик"),
          Question(question: "Cколько человек в струнном оркестре?"
             , answers: ["3", "4", "5", "6"]
             , correctAnswer: "4"),
          Question(question: "Какого сына не было у российского имератора Николая I?"
             , answers: ["Петр", "Александр", "Николай", "Константин"]
             , correctAnswer: "Петр"),
          Question(question: "Что понадобиться чтобы взрыхлить землю на грядке?"
             , answers: ["бабка", "тряпка", "скобка", "тяпка"]
             , correctAnswer: "тяпка"),
          Question(question: "Во что превращается гусеница?"
             , answers: ["В мячик", "В пирамидку", "В машинку", "В куколку"]
             , correctAnswer: "В куколку"),
          Question(question: "В какой басне Крылова среди действующих лиц есть человек?"
             , answers: ["Лягушка и Вол", "Свинья под Дубом", "Волк на псарне", "Осел и Соловей"]
             , correctAnswer: "Волк на псарне"),
          Question(question: "Какой фильм сделал знаменитой песню в исполнении Уитни Хьюстон?"
             , answers: ["Телохранитель", "Форест Гамп", "Пятый Элемент", "Красотка"]
             , correctAnswer: "Телохранитель")
     ]
     
    static func getAllQuestions() -> [Question] {
        return questions
    }
}
