//
//  main.swift
//  CodeStarterCamp_Week3
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - struct Person
// 사람이 공통적으로 가지는 특성을 프로퍼티로 정의해보기 -> 돈이라는 속성을 가지도록 해볼 것
// 사람이 공통적으로 할 수 있는 동작을 메서드로 정의해보기 -> 물건을 구매할 수 있도록 메서드를 정의해보기
class Person {
    var name: String
    var gender: Character?
    var money: Int
    
    init(name: String, gender: Character?, money: Int) {
        self.name = name
        self.gender = gender
        self.money = money
    }
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }

    func buy(about: String) {
        print("\(name)은 \(money)원으로 \(about)를 삽니다")
    }

    func asset() {
        print("\(name)의 현재 자산은 \(money)입니다.")
    }
}
// Person 타입의 인스턴스로 misterLee, missKim 생성
let misterLee = Person(name: "MR.Lee", gender: "⚨", money: 0)
let missKim = Person(name: "MS.Kim", gender: "♀", money: 32000)

// MARK: - enum Coffee
// 커피의 여러 종류들을 case로 가질 수 있도록 해봄
enum Coffee: String {
    case americano
    case latte
    case handDrip
    case luwak
}

// MARK: - class CoffeeShop
// CoffeeShop 타입 생성
// 카페들이 공통적으로 가지는 특성을 프로퍼티로 정의  -> 매출액(totalRevenue)을 속성으로 가진다, 메뉴판(커피 종류, 가격)을 가진다, 커피를 올려둘 수 있는 pickUpTable을 가진다.
// 카페들이 공통적으로 할 수 있는 동작을 메서드로 정의
class CoffeeShop {
    var totalRevenue: Int
    let menu: [Coffee : Int] = [.americano : 4500, .latte : 5000, .handDrip : 10000, .luwak : 100000]
    var barista: Person
    var customer: Person?
    var pickupTable: String?
    
    init(totalRevenue: Int, barista: Person, customer: Person?, pickupTable: String?) {
        self.totalRevenue = totalRevenue
        self.barista = barista
        self.customer = customer
        self.pickupTable = pickupTable
    }

    init(totalRevenue: Int, barista: Person, customer: Person) {
        self.totalRevenue = totalRevenue
        self.barista = barista
        self.customer = customer
    }

    init(totalRevenue: Int, barista: Person) {
        self.totalRevenue = totalRevenue
        self.barista = barista
    }
    
    func order(customer: Person, coffee: Coffee) {
        //        let coffePrice = menu[coffee]   // let coffePrice = menu[coffee] 를 하였더니 coffePrice의 값이 int? 값으로 반환됨
        if let coffePrice = menu[coffee] {
            if coffePrice > customer.money {
                print("잔액이 \(coffePrice - customer.money)원만큼 부족합니다.")
            }
            else {
                customer.money -= coffePrice
                totalRevenue += coffePrice
                print("\(coffePrice)원 짜리 \(coffee)주문을 받았습니다.")
                makeCoffe()
                let pickupTable = "\(customer.name)님의 \(coffee)가 준비되었습니다. 픽업대에서 가져가주세요."
                print(pickupTable)
            }
        }
    }
    
    func makeCoffe() {
        print("바리스타 \(barista.name)이 주문하신 음료를 제조중입니다.")
    }
    
    func cafeAsset() {
        print("카페의 현재 자산은 \(totalRevenue)입니다.")
    }
}

// yagombucks의 바리스타를 misterLee로 할당하기
let yagombucks = CoffeeShop(totalRevenue: 100000, barista: misterLee)
