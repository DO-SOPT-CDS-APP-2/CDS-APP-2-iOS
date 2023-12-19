//
//  Observable.swift
//  CDS-APP-2-iOS
//
//  Created by 변희주 on 2023/12/18.
//

import Foundation

// 제네릭 클래스 Observable 정의
final class Observable<T> {
  
  // 값이 변경될 때 호출될 클로저 타입 정의
  typealias Listener = (T) -> Void
  
  // 리스너 변수 선언
  var listener: Listener?
  
  // 제네릭 타입의 값 변수 선언
  var value: T {
    didSet {
      // 값이 변경되면 등록된 리스너에게 새로운 값 전달
      listener?(value)
    }
  }
  
  // 초기화 메서드 정의
  init(_ value: T) {
    self.value = value
  }
  
  // 외부에서 리스너를 등록할 수 있는 메서드 정의
  func bind(listener: Listener?) {
    self.listener = listener
    // 리스너 등록 시 현재의 값으로 초기 호출
    listener?(value)
  }
}
