export class ShoppingCart {
  #currency;
  #products;
  #purchasedProducts;

  constructor(products, currency) {
    this.#currency = currency;
    this.#products = products;
    this.#purchasedProducts = [];
  }

  getCurrency() {
    return this.#currency;
  }

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
    const productIndex = this.#purchasedProducts.findIndex(
      ({ SKU }) => SKU === product.SKU
    );

    if (productIndex !== -1) {
      if (quantity === 0) {
        this.#purchasedProducts.splice(productIndex, 1);
      } else {
        this.#purchasedProducts[productIndex].quantity = quantity;
      }
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

  calculateProdPrice(quantity, price) {
    return price * quantity;
  }
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
