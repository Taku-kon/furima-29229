window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById('add-tax-price')
  const itemProfit = document.getElementById('profit')

  itemPrice.addEventListener('input', function(){
    input = itemPrice.value
    tax = (input * 0.1)
    profit = (input * 0.9)
    taxPrice.innerHTML = tax
    itemProfit.innerHTML = profit
  })

})
