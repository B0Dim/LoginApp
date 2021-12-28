//
//  User.swift
//  LoginApp
//
//  Created by  BoDim on 28.12.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "bodim",
            password: "Password1",
            person: Person(
                name: "Dmitry",
                surname: "Bodakov",
                hobby: "Beautilit, Snowboarding, Cycling, Rollers, Photo, Drawing",
                age: 35,
                image: "bodim",
                info: "Меня зовут Дима. Я работаю разработчиком уже очень давно. На текущей основной работе занимаюсь веб разработкой. Также имею отличные скилы по Postgres и тд. Более 3-х лет назад начал писать свой личный проект на Swift - Beautilit. Проект давно запущен в Appstore. Swift изучал сам с 0."
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let hobby: String
    let age: Int
    let image: String
    let info: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
