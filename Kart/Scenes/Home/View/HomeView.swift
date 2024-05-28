//
//  HomeView\\.swift
//  Kart
//
//  Created by artmac on 28/05/24.
//

import Foundation
import UIKit

class HomeView: BaseViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        setupViewModel()
        viewModel.loadHomeData()
    }
    
    func setupViewModel(){
        viewModel.startAnimate = {[weak self] in
            self?.activityIndicator.isHidden = false
            self?.activityIndicator.startAnimating()
         }
        
        viewModel.stopAnimate = {[weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
        }
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
