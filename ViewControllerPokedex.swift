//
//  ViewControllerPokedex.swift
//  TableViewTabBar
//
//  Created by dmorenoar on 22/12/18.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit

class ViewControllerPokedex: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayPokemons = [Pokemon]()
    var tools:Tools = Tools()
    
    
    let url = URL(string: "https://private-5ec35-pokemonswift.apiary-mock.com/pokemons")
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Hay...",arrayPokemons.count)
        return arrayPokemons.count
    }
    
    var imagen:UIImage = UIImage()

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCellPokedex
        
        
        
        myCell.namePokemon.text = arrayPokemons[indexPath.row].nombre
        myCell.typePokemon.text = arrayPokemons[indexPath.row].tipo
 
        tools.getImage(imagenURL: arrayPokemons[indexPath.row].imagen) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    myCell.imgPokemon.image = imagen
                    return
                }
            }
        }
 
        myCell.typeImgPokemon.image = tools.getTypeImage(type: arrayPokemons[indexPath.row].tipo)

        return myCell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        decodeJsonData(url: url!)

    }
    
    
    func decodeJsonData(url:URL){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()

                self.arrayPokemons = try decoder.decode([Pokemon].self, from: data)
                print("recojo de api",self.arrayPokemons.count)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
        
        
      
    
        
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
