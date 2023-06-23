export class ProductCartAPI {
  constructor(apiUrl) {
    this.apiUrl = apiUrl;
  }

  //Asynchronous call to JSON API using await
  //Change to asynchronous
  // async fetchData() {
  //   const resp = await fetch(this.apiUrl);
  //   return resp.json();
  // }

  fetchData() {
    return new Promise((resolve, reject) => {
      fetch(this.apiUrl)
        .then((response) => response.json())
        .then(resolve);
    });
  }
}
