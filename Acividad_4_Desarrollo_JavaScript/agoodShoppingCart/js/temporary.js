class ProductCartAPI {
  constructor(apiUrl) {
    this.apiUrl = apiUrl;
  }

  fetchData() {
    return fetch(this.apiUrl)
      .then((response) => response.json())
      .then((data) => {
        const productData = data;
        console.log(productData);
        this.getCartAPIProducts(data);
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }

  addAPIProducts(data) {
    this.data = data;
    data.products.forEach((product) => {
      console.log(product);
      shoppingCart.addProduct(product);
    });
  }
}

// Creates an Instance of
const productCartAPIResponse = new ProductCartAPI(
  'https://jsonblob.com/api/jsonBlob/1108553464899977216'
);

productCartAPIResponse.fetchData();

// productCartAPIResponse.fetchData();

// class ShoppingCart {
//   constructor() {
//     this.products = [];
//   }

//   addProduct(product) {
//     this.products.push(product);
//     console.log(product);
//   }
// }
