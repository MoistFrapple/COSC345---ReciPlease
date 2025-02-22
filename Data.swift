//  Data.swift
//  WebScraper
//
//  Created by Baxter Robb on 2/06/21.
//
import Foundation

public class Data{
    
    public static var Ingredients: [Prod.Food] = []
    public static var RecipeList: [Reci.Recipe] = []
    public static var RelationTable: [(rec: Int, ingr: Int)] = []
    public static var RecipeNum = 0
    static var URLList: [String] = ["https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=2","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=3","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=4","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=5","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=6","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=7","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=8","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=9","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=10","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=11","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=12","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=13","https://shop.countdown.co.nz/api/v1/products?dasFilter=Department%3B%3Bfruit-veg%3Bfalse&target=browse&page=14"]
    
    init(){
        
    }
    
    public static func fillProds(){
        for url in URLList{
            prodRequest.getProducts(from: url)
        }
                    
    }
    
    public static func addRecipe(){
        let reci: Reci.Recipe = Reci.Recipe.init(method: "Chuck shit in bowl", description: "Bit Yuck ay only two herbs", Ingredients: ["superb herb mint fresh","superb herb dill fresh"], Quants: [1,1],Serving: 4)
        
        for prodDesc in reci.Ingredients{
            print("lookingG")
            for i in 0..<Ingredients.count{
                if prodDesc == Ingredients[i].name{
                    RelationTable.append((RecipeNum, i))
                    print("FouNdYACU")
                }
            }
        }
        
        RecipeList.append(reci)
        RecipeNum += 1
        
    }
    
    public static func priceRecipe(recNum: Int) -> Double{
        var price = 0.0
        var recInd = 0

        for i in 0..<RelationTable.count{

            if(RelationTable[i].rec > recNum){
                print("looking")
                return price
            }
            if(RelationTable[i].rec == recNum && recInd<2){
                price += Ingredients[RelationTable[i].ingr].price.salePrice * RecipeList[recNum].Quants[recInd]
                recInd += 1
            }
        }
        return price

    }
}
