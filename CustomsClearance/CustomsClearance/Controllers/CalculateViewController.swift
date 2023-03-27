//
//  ViewController.swift
//  CustomsClearance
//
//  Created by Alexandr Chernets on 20.03.2023.
//

import UIKit

// Make all non hierarchical classes as final
class CalculateViewController: UIViewController {
    
    // MARK: @IBOutlets
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var productionYearsTextField: UITextField!
    @IBOutlet weak var fuelTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    // MARK: Properties
    
    private var typePickerView = UIPickerView()
    private var brandPickerView = UIPickerView()
    private var productionYearsPickerView = UIPickerView()
    private var fuelPickerView = UIPickerView()
    
    // You can short that with explicit type for arrays or case iterrable
    // private var types: [TypeCar] = [.type, .sedan, .coupe, .stationWagon, .minivan]
    // private var types = TypeCar.allCases
    private var types = [TypeCar.type,TypeCar.sedan, TypeCar.coupe, TypeCar.stationWagon, TypeCar.minivan]
    private var brands = [Brand.brandType, Brand.audi, Brand.bmw, Brand.mazda, Brand.mercedesBenz, Brand.volkswagen]
    private var fuels = [FuelType.fuelType, FuelType.diesel, FuelType.petrol, FuelType.gas, FuelType.electro]
    private var productionYears = [ProductionYear.year, ProductionYear.year2015,
                                   ProductionYear.year2016, ProductionYear.year2017,
                                   ProductionYear.year2018, ProductionYear.year2019,
                                   ProductionYear.year2020, ProductionYear.year2021,
                                   ProductionYear.year2022, ProductionYear.year2023]
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureSegmentControl()
        configurePickerViewColor()
    }
    
    // MARK: @IBActions
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        guard (typePickerView.selectedRow(inComponent: 0) != 0),
              (brandPickerView.selectedRow(inComponent: 0) != 0),
              (productionYearsPickerView.selectedRow(inComponent: 0) != 0),
              (fuelPickerView.selectedRow(inComponent: 0) != 0)
        else {
            // Localization missing
            let alert = UIAlertController(title: "Error", message: "Please select all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let typesPrice = types[typePickerView.selectedRow(inComponent: 0)].price
        let brandsPrice = brands[brandPickerView.selectedRow(inComponent: 0)].price
        let productionYearsPrice = productionYears[productionYearsPickerView.selectedRow(inComponent: 0)].price
        let fuelsPrice = fuels[fuelPickerView.selectedRow(inComponent: 0)].price
        
        guard let selectCountry = Country(rawValue: segmentControl.selectedSegmentIndex) else { return }
        // Better to change it to single logic if it is totally the same
        
        switch selectCountry {
        case .ukraine:
            let result = Double(typesPrice + brandsPrice + productionYearsPrice + fuelsPrice) * Country.ukraine.coefficient
            priceLabel.text = String(result)
        case .usa:
            let result = Double(typesPrice + brandsPrice + productionYearsPrice + fuelsPrice) * Country.usa.coefficient
            priceLabel.text = String(result)
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        clear()
    }
    @IBAction func segmentValueChange(_ sender: Any) {
        clear()
    }
    
    // MARK: Public functions
    
    public func clear() {
        typeTextField.text = nil
        brandTextField.text = nil
        productionYearsTextField.text = nil
        fuelTextField.text = nil
        pickerSelectBy(row: 0)
        pickerViewSelectRow()
        priceLabel.text = "0.0"
    }// need spacing
    public func configureSegmentControl() {
        segmentControl.removeAllSegments()
        segmentControl.insertSegment(withTitle: Country.ukraine.title, at: 0, animated: false)
        segmentControl.insertSegment(withTitle: Country.usa.title, at: 1, animated: false)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.layer.cornerRadius = 15
    }
    // Some of fucntions are public - why?
    public func configureTextFields() {
        typePickerView.delegate = self
        typePickerView.dataSource = self
        typeTextField.inputView = typePickerView
        typeTextField.tintColor = UIColor.clear
        
        brandPickerView.delegate = self
        brandPickerView.dataSource = self
        brandTextField.inputView = brandPickerView
        brandTextField.tintColor = UIColor.clear
        
        productionYearsPickerView.delegate = self
        productionYearsPickerView.dataSource = self
        productionYearsTextField.inputView = productionYearsPickerView
        productionYearsTextField.tintColor = UIColor.clear
        
        fuelPickerView.delegate = self
        fuelPickerView.dataSource = self
        fuelTextField.inputView = fuelPickerView
        fuelTextField.tintColor = UIColor.clear
        
        pickerSelectBy(row: 0)
    }
    public func pickerSelectBy(row: Int) {
        typeTextField.text = types[row].title
        brandTextField.text = brands[row].title
        productionYearsTextField.text = productionYears[row].rawValue
        fuelTextField.text = fuels[row].title
    }// need spacing
    public func pickerViewSelectRow() {
        let pickers = [typePickerView, brandPickerView, productionYearsPickerView, fuelPickerView]
        for picker in pickers {
            picker.selectRow(0, inComponent: 0, animated: true)
        }
    }// need spacing
    func configurePickerViewColor() {
        typePickerView.backgroundColor = typeTextField.backgroundColor
        brandPickerView.backgroundColor = typeTextField.backgroundColor
        productionYearsPickerView.backgroundColor = typeTextField.backgroundColor
        fuelPickerView.backgroundColor = typeTextField.backgroundColor
    }
    
    // Сlosing the pickerView when you click on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: UIPickerViewDelegate & UIPickerViewDataSource

extension CalculateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // need spacing
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == typeTextField.inputView {
            return types.count
        } else if pickerView == brandTextField.inputView {
            return brands.count
        } else if pickerView == productionYearsTextField.inputView {
            return productionYears.count
        } else if pickerView == fuelTextField.inputView {
            return fuels.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == typeTextField.inputView {
            return types[row].title
        } else if pickerView == brandTextField.inputView {
            return brands[row].title
        } else if pickerView == productionYearsTextField.inputView {
            return productionYears[row].rawValue
        } else if pickerView == fuelTextField.inputView {
            return fuels[row].title
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typeTextField.inputView {
            typeTextField.text = types[row].title
            typeTextField.resignFirstResponder()
        } else if pickerView == brandTextField.inputView {
            brandTextField.text = brands[row].title
            brandTextField.resignFirstResponder()
        } else if pickerView == productionYearsTextField.inputView {
            productionYearsTextField.text = productionYears[row].rawValue
            productionYearsTextField.resignFirstResponder()
        } else if pickerView == fuelTextField.inputView {
            fuelTextField.text = fuels[row].title
            fuelTextField.resignFirstResponder()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        switch pickerView {
        case typePickerView:
            label.text = types[row].title
        case brandPickerView:
            label.text = brands[row].title
        case productionYearsPickerView:
            label.text = productionYears[row].rawValue
        case fuelPickerView:
            label.text = fuels[row].title
        default:
            break
        }
        return label
    }
}
