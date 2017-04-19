//
//  PayViewController.swift
//  qian8new
//
//  Created by zhiyuan on 2016/10/13.
//  Copyright © 2016年 leeey. All rights reserved.
//

import UIKit

class PayViewController:UITableViewController {
    let dataList = DBRecord().getExpensesList()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func inittitle()->PayViewController{
        
        return self
    }
    
    // MARK: - 按钮
    func 添加页(){
        let addpayview = AddPayViewController()
        //addpayview.delegate = self
        let addPay = UINavigationController(rootViewController: addpayview)
        self.navigationController?.present(addPay, animated: true, completion:nil)
    }
    
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    var taptime = CGFloat()
    //双击打开添加页
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let curr = Date().timeIntervalSince1970
        if (CGFloat(curr) - CGFloat(taptime) < 0.9) {
            添加页()
            taptime = 0
        }else{ taptime = CGFloat(curr) }
        return false
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListCellView(cellStyle:ListCellStyle.Expense, reuseIdentifier:ListCellView.identifier)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        let item = dataList[indexPath.row]
        //公用
        cell.money.text    = item.price
        cell.time.text     = item.time
        cell.note.text     = item.demo
        cell.bankFrom.text = item.bank_name
        cell.user.text     = item.user_name
        cell.type.text     = item.cate_name
        cell.icon.contents = UIImage(named:"p\(item.cate_id)")?.cgImage
        return cell
    }
}