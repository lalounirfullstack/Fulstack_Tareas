class Product {
  #sku;
  #title;
  #price;

  constructor(productInfo) {
    this.#sku = productInfo.SKU;
    this.#title = productInfo.title;
    this.#price = productInfo.price;
  }

  getSKU() {
    return this.#sku;
  }

  getTitle() {
    return this.#title;
  }

  getPrice() {
    return this.#price;
  }
}

const productInfo = {
  SKU: 'ABCD',
  title: 'Test',
  price: 9.99,
};

const prod1 = new Product(productInfo);
console.log(prod1.getSKU());
console.log(prod1.getTitle());
console.log(prod1.getPrice());
