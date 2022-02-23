//
//  ViewController.swift
//  SampleAsyncAwait
//
//  Created by 岩本康孝 on 2022/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // リクエストURLの組み立て
        let req_url = URL(string: "https://api.national-holidays.jp/all")!

        // 非同期の作業単位
        Task {
            print("1.データの取得を開始します")

            do {
                let (data , response) = try await URLSession.shared.data(from: req_url)
                // データ取得に成功
                if (response as? HTTPURLResponse)?.statusCode == 200 {
                    print("2.データの取得できた")
                }
                print("3.すべての処理が終了")
            } catch {
                print("4. 例外")
            }
        }
        print("作業終了")
    }
}

