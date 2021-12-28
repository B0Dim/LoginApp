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
                image: "")
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let hobby: String
    let age: Int
    let image: String
}
