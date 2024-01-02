//
//  TabelTableViewController.swift
//  news
//
//  Created by Amelie Baimukanova on 02.01.2024.
//

import UIKit

class TabelTableViewController: UITableViewController {
    var arrayNews = [News(name: "салюты установили рекорд гинесса", descriptions: "Установка двух новых рекордов Гиннесса создала восторженную атмосферу праздника, объединив тысячи гостей и жителей эмирата. 2023 год оказался весьма успешным для туристической отрасли Рас-эль-Хаймы: мы достигли ряда значительных результатов, приближающих нас к глобальной цели - принять более 3 миллионов посетителей к 2030 году, - отметил Раки Филлипс, глава Департамента по развитию туризма эмирата Рас-Эль-Хаймы.",
        image: "salut"),
        News(name: "эко-волонтеры", descriptions: "Эко-волонтерство - это не просто забота о природе, это полноценный опыт взаимодействия с окружающей средой. Он меняет взгляд на природу и воздействие человека на нее. Участники программ имеют возможность присоединиться к различным проектам по охране природы, начиная от мониторинга местных видов до участия в программе по пересаживанию растений.Участники не только предоставляют свою помощь в сохранении биоразнообразия и чистоте местности, но и получают уникальный шанс насладиться жизнью в экзотической стране. Важно отметить, что эти программы предоставляют не только опыт, но и образовательные возможности. Участники узнают о местной экосистеме, проблемах, с которыми она сталкивается, и о том, какие шаги можно предпринять для ее сохранения. ",
            image: "eco"),
        News(name: "за снежные дороги", descriptions: "По данным департамента по чрезвычайным ситуациям Акмолинской области, 1 января с 22:00 открыто движение для всех видов автотранспорта на дороге республиканского значения Кокшетау - Атбасар на участке протяженностью 47-120 километров из села Зеренда до поселка Максимовка.Также в 23:30 открыто движение для всех видов автотранспорта на участке дороги республиканского значения Кокшетау - Атбасар на 120-184-м километре из поселка Максимовка до Атбасара",
             image: "road")]
               
    var time = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
            tableView.reloadData()
    }

    @objc func countTime(){
        arrayNews.insert(arrayNews[2], at: 0)
        tableView.reloadData()
    }
    


    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let labelName = cell.viewWithTag(1000) as! UILabel
        labelName.text = arrayNews[indexPath.row].name
        let labelNews = cell.viewWithTag(1001) as! UILabel
        labelNews.text = arrayNews[indexPath.row].descriptions
        let image = cell.viewWithTag(1002) as! UIImageView
        image.image = UIImage(named: arrayNews[indexPath.row].image)
        // Configure the cell...
        let dateFormatter = DateFormatter()
        let todayDate = Date()
        dateFormatter.dateFormat = "dd.MM.y HH:mm:ss"
        let formattedDate = dateFormatter.string(from: todayDate)
        let labelDate = cell.viewWithTag(1003) as! UILabel
        labelDate.text = String(formattedDate)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 583
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
