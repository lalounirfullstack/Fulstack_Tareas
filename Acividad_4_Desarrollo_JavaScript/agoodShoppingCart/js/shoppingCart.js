class ProductCartAPI {
  constructor(apiUrl) {
    this.apiUrl = apiUrl;
  }

  fetchData() {
    return fetch(this.apiUrl)
      .then((response) => response.json())
      .then((data) => {
        const productData = data;
        const shoppingCart = new ShoppingCart(productData);
        console.log('Api: ', productData);
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }
}

class ShoppingCart {
  #products;
  //#purchasedProducts;

  constructor(data) {
    this.#products = data;
    //this.#purchasedProducts = [];
    console.log('Shopping Cart Products:', this.#products);
  }

  // addProducts(product) {
  //   this.#products.push(product);
  // }

  displayProducts() {
    this.#products;
  }

  // getCartSize() {
  //   return this.#products.length;
  // }

  // getCartPurchasedProducts() {
  //   return this.#purchasedProducts.length;
  // }

  // getProduct(sku) {
  //   return this.#products.find((product) => product.getSKU() === sku);
  // }

  // calculateShoppingCartTotal() {
  //   return this.#purchasedProducts.reduce((acc, product) => {
  //     return acc + product.getPrice();
  //   }, 0);
  // }

  // calculateProdPrice(quantity, price) {
  //   return price * quantity;
  // }
}

const productCartAPIResponse = new ProductCartAPI(
  'https://jsonblob.com/api/jsonBlob/1108553464899977216'
);
productCartAPIResponse.fetchData();

const shoppingCart = new ShoppingCart(data);
shoppingCart.displayProducts();
