export class ProductCartAPI {
  constructor(apiUrl) {
    this.apiUrl = apiUrl;
  }

  async fetchData() {
    const resp = await fetch(this.apiUrl);
    return resp.json();
  }
}
