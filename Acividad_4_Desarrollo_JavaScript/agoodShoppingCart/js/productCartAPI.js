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
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }
}

// Creates an Instance of
const productCartAPIResponse = new ProductCartAPI(
  'https://jsonblob.com/api/jsonBlob/1108553464899977216'
);

productCartAPIResponse.fetchData();
