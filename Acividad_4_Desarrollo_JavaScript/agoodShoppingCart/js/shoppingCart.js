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

  getCart() {
    let total = 0;

    const products = this.#purchasedProducts.map((product) => {
      const subtotal = this.calculateProdPrice(product.quantity, product.price);

      total += subtotal;

      return {
        ...product,
        subtotal,
      };
    });

    return {
      total,
      products,
    };
  }

  addPurchasedProducts(product, quantity) {
    const found = this.#purchasedProducts.find(
      ({ SKU }) => SKU === product.SKU
    );

    if (found) {
      found.quantity = quantity;
    } else {
      const productCopy = JSON.parse(JSON.stringify(product));
      productCopy.quantity = quantity;
      this.#purchasedProducts.push(productCopy);
    }
  }

  getCartSize() {
    return this.#products.length;
  }

  getAllProductSKUs(data) {
    let skus = [];
    data.products.forEach((product) => skus.push(product.SKU));
    return skus;
  }

  getAllProducts(ďata) {
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

  calculateProdPrice(quantity, price) {
    return price * quantity;
  }

  // getcartProductInfo(sku) {
  //   const prod = {};
  //   prod.name = this.#products.product.title;
  //   prod.sku = this.#products.product.SKU;
  //   prod.quantity = 5;
  //   return product;
  // }

  //getCart()

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
