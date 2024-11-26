function price() {
  const itemprice = document.getElementById("item-price")
  const addtaxprice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemprice.addEventListener('input', function() {
    let values = itemprice.value
    let tax = values * 0.1
    addtaxprice.innerHTML = Math.floor(tax)
    profit.innerHTML = Math.floor(values - tax)
  })
}

window.addEventListener("turbo:load", price)
window.addEventListener("turbo:render", price);