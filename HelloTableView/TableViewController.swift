//
//  TableViewController.swift
//  HelloTableView
//
//  Created by Михаил Зайцев on 25.01.16.
//  Copyright © 2016 Xanik. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Создать пустой массив, в котором будут содержаться строки
    var items:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupData(){
        
        // Семейство шрифтов в виде массива строка с их названиями
        let familyNames = UIFont.familyNames()
        
        // Для названия каждого семейства шрифтов
        for aFamilyName in familyNames {
            
            // найдем все шрифты этого семейства
            let allFontOfThisFamily:[String] = UIFont.fontNamesForFamilyName(aFamilyName)
            
            // добавим все строки
            items += allFontOfThisFamily
        }
    }
}

// Поддерживает протокол UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    
}

// Поддерживает протокол UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /* Убедимся, что у нас есть какие-то элементы для отображения
        guard items != nil else {
            return 0
        }*/
        return items.count
    }
    
    // indexPath - адрес ячейки в таблице
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Запросить прототип ячейки у TableView
        let cell = tableView.dequeueReusableCellWithIdentifier("JustACelID", forIndexPath: indexPath)
        
        let fontName = items[indexPath.row]
        let font = UIFont(name: fontName, size: 14)
        
        cell.textLabel?.text = items[indexPath.row]
        
        cell.textLabel?.font = font
        return cell
    }
}
