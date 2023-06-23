/*
 >>> Product API Class <<<
 >>> Created By: Lalo Aguirre
 >>> Last Modified Date: 06-25-2023
*/

// Export Class to be used in Index JS
export class ProductCartAPI {
  constructor(apiUrl) {
    this.apiUrl = apiUrl;
  }

  //Asynchronous call to JSON API using await: This works fine as well.
  //Change to asynchronous
  // async fetchData() {
  //   const resp = await fetch(this.apiUrl);
  //   return resp.json();
  // }

  /*Note: Adjusted based on Felix's recommendation to remove await*/
  fetchData() {
    return new Promise((resolve, reject) => {
      fetch(this.apiUrl)
        .then((response) => response.json())
        .then(resolve);
    });
  }
}
