//
//  DashboardViewController.swift
//  ForecastApp
//
//  Created by Rafsan Nazmul on 11/25/22.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var rainLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var tableContainerView: UIView!
    
    var dashboardModel = DashboardModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashboardModel.getWeather()
        bind()
    }
    
    private func bind() {
//        self.viewModel.currentPressure.bind { [weak self] currentPressure in
//            self?.currentPressure.text = currentPressure
//        }
        self.dashboardModel.navigationBarTitle.bind { [weak self] currentNavigationBarTitle in
            self?.locationLabel.text = currentNavigationBarTitle
        }
        self.dashboardModel.currentHumidity.bind { [weak self] currentHumidity in
            self?.humidityLabel.text = currentHumidity
        }
        self.dashboardModel.currentTemperature.bind { [weak self] currentTemperature in
            self?.temperatureLabel.text = currentTemperature
        }
        self.dashboardModel.currentWindSpeed.bind { [weak self] currentWindSpeed in
            self?.windLabel.text = currentWindSpeed
        }
        dashboardModel.addWeatherSettings()
        
        dump(dashboardModel.weather.currentWeather)
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
