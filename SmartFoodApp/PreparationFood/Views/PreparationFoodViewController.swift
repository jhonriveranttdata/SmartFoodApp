//
//  PreparationFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 15/12/22.
//

import UIKit

class PreparationFoodViewController: UIViewController {
    
    @IBOutlet weak var imagePreparation: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var textViewPreparation: UITextView!
    
    var presenter: PreparationFoodPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let str = presenter?.preparation.imgName else { return }
        loadFrom(URLAddress: str)
        nombreLabel.text = presenter?.preparation.nombre
        textViewPreparation.text = presenter?.preparation.preparacion
    }
    
    func loadFrom(URLAddress: String) {
        if let url = URL(string: URLAddress) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Error handling...
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self.imagePreparation.image = UIImage(data: imageData)
                }
            }.resume()
        }
    }
}
