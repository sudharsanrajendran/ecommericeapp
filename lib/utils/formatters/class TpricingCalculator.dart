class Tpricingcalcator{
  static double calculateTotalprice(double productprice,String location)
  {
    double taxrate =getTaxRateForLocation(location);
    double taxAmount = productprice*taxrate;
    double shippingCost = getShippingCost(location);
    double totalprice = productprice+taxAmount+shippingCost;
    return totalprice;
  }

  // calculate shipping cost

static String CalculateShippingCost(double productprice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);

}
static String calculateTax(double productprice , String location){
    double taxrate = getTaxRateForLocation(location);
    double   taxAmount=productprice*taxrate;
    return taxAmount.toStringAsFixed(2);
}
static double getTaxRateForLocation(String location){
    //look the tax rate for the given location from tax rate database or api
  //retun the appropirate tax rate
    return 0.10; //examoke for rate 10%
}
  static double getShippingCost(String location){
    //look the tax rate for the given location from tax rate database or api
    //calculate the shipping cost based on various factors like distance ,weight,etc
    return 5.00; //examoke for rate 10%
  }
 // static double calculatecarttotal(cartmodel cart){
    //return cart.items.map((e)=>e.price).fold(0,(previousPirce,currentprice)=>previousPrice+(currentPrice ??0))
 // }

}