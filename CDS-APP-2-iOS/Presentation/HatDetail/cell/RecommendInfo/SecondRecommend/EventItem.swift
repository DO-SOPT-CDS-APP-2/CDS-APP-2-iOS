//
//  EventItem.swift
//  CDS-APP-2-iOS
//
//  Created by Gahyun Kim on 2023/11/28.
//

import UIKit

struct EventItem {
    let image: UIImage
    let eventTitle: String
    let eventDuration: String
}

extension EventItem{
    static func eventDummy() -> [EventItem] {
        return [
            EventItem(image: ImageLiterals.img.imgEvent1,
                      eventTitle: "패션 인플루언서들의 여름 스타일링",
                      eventDuration: "2023.07.07~"),
            
            EventItem(image: ImageLiterals.img.imgEvent2,
                      eventTitle: "29CM, 파리에 가다",
                      eventDuration: "2023.07.11~"),
            
            EventItem(image: ImageLiterals.img.imgEvent3,
                      eventTitle: "역동적인 봄의 시작",
                      eventDuration: "2022.02.18~"),
            
            EventItem(image: ImageLiterals.img.imgEvent4,
                      eventTitle: "역동적인 봄의 시작",
                      eventDuration: "2021.09.02~"),
            
        ]
    }
}
