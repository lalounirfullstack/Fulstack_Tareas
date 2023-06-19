export class ShoppingCart {
  #products;
  #purchasedProducts;

  constructor(products) {
    this.#products = products;
    this.#purchasedProducts = [];
    //console.log('Shopping Cart Products:', this.#products);
  }

  // addPurchasdedProducts(sku) {

  // }

  getProducts() {
    return this.#products;
  }

  getCartSize() {
    return this.#products.length;
  }

  getAllProductSKUs(data) {
    let skus = [];
    data.products.forEach((product) => skus.push(product.SKU));
    return skus;
  }

  getAllProductSKUs(data) {
    let skus = [];
    data.products.forEach((product) => skus.push(product.SKU));
    return skus;
  }

  getAllProducts(data) {
    let products = [];
    data.products.forEach((product) => products.push(product.title));
    return products;
  }

  getProduct(sku) {
    const product = this.#products.find((product) => product.SKU === sku);
    if (product) {
      return product;
    } else {
      return `No se encontro Producto`;
    }
  }

  getProductSKU(title) {
    const product = this.#products.find((product) => product.title === title);
    if (product) {
      return product;
    } else {
      return `No se encontro SKU`;
    }
  }

  //TO DO
  // getcartProductInfo(sku) {
  //   const prod = {};
  //   prod.name = this.#products.product.title;
  //   prod.sku = this.#products.product.SKU;
  //   prod.quantity = 5;
  //   return product;
  // }

  //getCart()

  // calculateProdPrice(quantity, price) {
  //   return price * quantity;
  // }

  // getCartPurchasedProducts() {
  //   return this.#purchasedProducts.length;
  // }

  // calculateShoppingCartTotal() {
  //   return this.#purchasedProducts.reduce((acc, product) => {
  //     return acc + product.getPrice();
  //   }, 0);
  // }
}

// const productCartAPIResponse = new ProductCartAPI(
//   'https://jsonblob.com/api/jsonBlob/1108553464899977216'
// );

// productCartAPIResponse.fetchData().then((data) => {
//   const shoppingCart = new ShoppingCart(data.products);
//   //console.log(shoppingCart.displayProductsInfo());
//   console.log(shoppingCart.getProduct('0K3QOSOV4V'));
//   console.log(shoppingCart.getProductSKU('Funda de piel'));
//   console.log(shoppingCart.getCartSize());
//   console.log(shoppingCart.getAllProductSKUs(data));
//   console.log(shoppingCart.getAllProducts(data));
// });
