/*
 >>> Main Shopping Cart Class <<<
 >>> Created By: Lalo Aguirre
 >>> Last Modified Date: 06-25-2023
*/

// Export Class to be used in Index JS
export class ShoppingCart {
  //Variables
  #currency;
  #products;
  #purchasedProducts;

  constructor(products, currency) {
    //Currency:Stores currency Symbol from JSON API
    this.#currency = currency;

    //Products:Stores SKU, Title, Price from from JSON API
    this.#products = products;

    //Stores products purchased by Customer
    this.#purchasedProducts = [];
  }

  getCurrency() {
    return this.#currency; //Currency Symbol
  }

  getProducts() {
    return this.#products; //Arrays of Objects Prod
  }

  getCart() {
    let total = 0; //Accumulates Total

    const products = this.#purchasedProducts.map((product) => {
      const subtotal = this.calculateProdPrice(product.quantity, product.price);

      total += subtotal;

      return {
        // Shallow Copy of Product to preserve original Prod
        //and add Subtotal.. Original Product No Subtotal
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
      //Converts object to String and String back to Object
      const productCopy = JSON.parse(JSON.stringify(product));
      productCopy.quantity = quantity;
      this.#purchasedProducts.push(productCopy);
    }
  }

  removeAllProducts() {
    this.#purchasedProducts = [];
  }

  getCartSize() {
    return this.#products.length;
  }

  getAllProductSKUs(data) {
    let skus = [];
    data.products.forEach((product) => skus.push(product.SKU));
    return skus;
  }

  //Returns Products
  getAllProducts(ďata) {
    let products = [];
    data.products.forEach((product) => products.push(product.title));
    return products;
  }

  getShoppingCartInfo() {
    const ret = {};
    console.log('Get Shopping Cart:', this.#purchasedProducts.title);
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
