//
//  HomeViewController.swift
//  ForecastApp
//
//  Created by Rafsan Nazmul on 11/22/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeModel = HomeModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.homeModel.actualLocation()
        }
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
        homeModel.getWeather {
            vc!.modalPresentationStyle = .overFullScreen
            vc!.dashboardModel.weather = self.homeModel.weather
            print("")
            self.present(vc!, animated: true)
        }
    }


}
