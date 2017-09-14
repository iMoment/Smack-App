//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by Stanley Pan on 15/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var avatarSegmentedControl: UISegmentedControl!
    @IBOutlet weak var avatarCollectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        avatarCollectionView.delegate = self
        avatarCollectionView.dataSource = self
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        
    }
    
}

extension AvatarPickerVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension AvatarPickerVC: UICollectionViewDelegate {
    
}

extension AvatarPickerVC: UICollectionViewDelegateFlowLayout {
    
}













