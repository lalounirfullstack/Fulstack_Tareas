class Product {
  #currency;
  #sku;
  #title;
  #price;

  constructor(productInfo) {
    this.currency = productInfo.currency;
    this.#sku = productInfo.SKU;
    this.#title = productInfo.title;
    this.#price = productInfo.price;
  }

  getCurrency() {
    return this.#currency;
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

// const productInfo = {
//   currency:
//   SKU: 'ABCD',
//   title: 'Test',
//   price: 9.99,
// };

// const data = {
//   products: [
//     { id: 1, name: 'Producto 1' },
//     { id: 2, name: 'Producto 2' },
//     { id: 3, name: 'Producto 3' },
//   ],
// };

// const mappedProducts = data.products.map((product) => {
//   return { id: product.id, name: product.name.toUpperCase() };
// });

//console.log(mappedProducts); //console.log(productInfo.currency);

const data = {
  currency: '$',
  products: [
    {
      SKU: '0K3QOSOV4V',
      title: 'iFhone 13 Pro',
      price: '938.99',
    },
    {
      SKU: 'TGD5XORY1L',
      title: 'Cargador',
      price: '49.99',
    },
    {
      SKU: 'IOKW9BQ9F3',
      title: 'Funda de piel',
      price: '79.99',
    },
  ],
};

data.products.forEach((prod) => {
  console.log(prod);
});

// const data = {
//   category: 'Electrónicos',
//   products: [
//     { id: 1, name: 'Producto 1' },
//     { id: 2, name: 'Producto 2' },
//     { id: 3, name: 'Producto 3' },
//   ],
//   info: {
//     location: 'Categoría A',
//     count: 3,
//   },
// };

// const newArray = [];

// for (let key in data) {
//   if (Array.isArray(data[key])) {
//     data[key].forEach((item) => {
//       newArray.push(item);
//     });
//   } else if (typeof data[key] === 'object' && data[key] !== null) {
//     newArray.push(data[key]);
//   }
// }

// arrayOfArrays.forEach((prod) => {
//   console.log(prod);
// });

// const mappedProduct1 = prodData.products.map((product) => {
//   return {
//     SKU: product.SKU,
//     title: product.title.toUpperCase(),
//     price: product.price,
//   };
// });

// console.log(mappedProduct1); //console.log(productInfo.

// console.log(mappedProduct1.SKU);

// const prod1 = new Product(productInfo);
// console.log(prod1);
//console.log(prod1);
//console.log(prod1.getCurrency());
// console.log(prod1.products.getSKU());
// console.log(prod1.getTitle());
// console.log(prod1.getPrice());
