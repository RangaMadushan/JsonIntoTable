//
//  HeroDetails.swift
//  ApiDataIntoTVC
//
//  Created by Ranga Madushan on 3/29/18.
//  Copyright © 2018 Ranga Madushan. All rights reserved.
//

import UIKit

struct HeroDetails: Decodable {
    let localized_name: String;
    let primary_attr: String;
    let attack_type: String;
    let legs: Int;
    let img: String;
}

//meka internet eken gaththe image download karganna

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}


















