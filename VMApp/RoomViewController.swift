//
//  RoomViewController.swift
//  VMApp
//
//  Created by Faheem Hussain on 29/07/22.
//

import UIKit

class RoomViewController: UIViewController {

    @IBOutlet weak var tvList: UITableView!
    
    var viewModel = VCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.initialSetup()
    }
    func initialSetup(){
        Helper.StatusBarColor(view: self.view)
        self.tvList.register(UINib(nibName: "TblRoomsCell", bundle: nil), forCellReuseIdentifier: "TblRoomsCell")
        self.modelDataChangeSetup()
        self.roomsAPI()
       
    }

}
extension RoomViewController{
    //MARK: - Rooms  API Calls
    func roomsAPI() {
        if Helper.checkConnectivity() {
            viewModel.roomsList( )
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
    func modelDataChangeSetup(){
        viewModel.itemsRoomsDidChange = { [weak self] modelData in
            if ((modelData as? [peopleModel]) != nil){
                DispatchQueue.main.async {
                    self?.tvList.reloadData()
                }
            }
        }
    }
}
//MARK: - Table DataSource
extension RoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.roomsData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TblRoomsCell", for: indexPath) as! TblRoomsCell
            cell.selectionStyle = .none
            cell.setupUI()
            cell.peopleData = viewModel.roomsData?[indexPath.row]
            cell.setupData()
        return cell
    }
}
//MARK: - Table Delegate
extension RoomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
