//
//  ListModel.swift
//  creatingList
//
//  Created by Gaurav Sara on 14/01/24.
//

import Foundation

struct UserModel {
    var type: String?
    var title: String?
    var image: String?
    var id: Int?
}

struct CompetitionSummaryList {

    var id: Int?
    var image: String?
    var items: [CompetitionSummaryList]?
    var title: String?
    var type: String?

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String: Any]) {
        id = dictionary["id"] as? Int
        image = dictionary["image"] as? String

        // Correct the casting for the "items" key
        if let itemsArray = dictionary["items"] as? [[String: Any]] {
            items = itemsArray.map { CompetitionSummaryList(fromDictionary: $0) }
        }

        title = dictionary["title"] as? String
        type = dictionary["type"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the appropriate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if let id = id {
            dictionary["id"] = id
        }
        if let image = image {
            dictionary["image"] = image
        }
        if let items = items {
            // Correct the conversion for the "items" key
            dictionary["items"] = items.map { $0.toDictionary() }
        }
        if let title = title {
            dictionary["title"] = title
        }
        if let type = type {
            dictionary["type"] = type
        }
        return dictionary
    }
}
