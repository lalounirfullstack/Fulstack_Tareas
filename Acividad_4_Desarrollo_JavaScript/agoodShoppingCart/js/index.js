/*
 >>> DOM Manipulation Script <<<
 >>> Created By: Lalo Aguirre
 >>> Last Modified Date: 06-25-2023
*/

/*Import Classes*/
import { ProductCartAPI } from './productCartAPI.js';
import { ShoppingCart } from './shoppingCart.js';

function buildCartProducts(products) {
  const table = document.querySelector(
    '.cart__container-products__table tbody'
  );

  //Loops through Products and display Products from JSON API
  console.log(products);
  products.forEach(({ SKU, title, price }) => {
    //TRs for API Products
    const row = document.createElement('tr');

    // Table Cells
    const cellImage = document.createElement('td');
    cellImage.classList.add('cart__container-product-img');
    const cellProduct = document.createElement('td');
    const cellPrice = document.createElement('td');
    const cellQuantity = document.createElement('td');
    cellQuantity.classList.add('cart__container-qty');
    const cellTotal = document.createElement('td');

    cellPrice.innerText = `${price}${shoppingCart.getCurrency()}`;
    cellProduct.innerText = `${title} - Ref: ${SKU}`;
    cellQuantity.innerHTML = `<button class="cart__container__minus">
                              <img src='../img/logos/MinusCircle.GIF' width="20px" height="20px" class="cart__container__minus-img">
                              </button>
                              <input type="number" data-sku="${SKU}" id="qty" class="cart__container_product-quantity" min="0" value="0">
                              <button class="cart__container__plus">
                              <img src='../img/logos/PlusCircle.GIF' width="20px" height="20px" class="cart__container__minus-img">
                              </button>`;
    cellTotal.innerText = `0 ${shoppingCart.getCurrency()}`;

    row.appendChild(cellProduct);
    row.appendChild(cellQuantity);
    row.appendChild(cellPrice);
    row.appendChild(cellTotal);

    table.appendChild(row);
  });

  bindEvents();
}

const updateQuantity = (cell, quantity, productIndex) => {
  const product = shoppingCart.getProducts()[productIndex];
  const totalCell = cell.parentElement.children[3];

  shoppingCart.addPurchasedProducts(product, quantity);

  totalCell.innerHTML =
    shoppingCart.calculateProdPrice(quantity, product.price).toFixed(2) +
    shoppingCart.getCurrency();

  updateTotals();
};

const updateTotals = () => {
  const { products, total } = shoppingCart.getCart();
  const container = document.querySelector('.cart__container-cart-total-item');

  container.innerHTML = '';

  products.forEach((product) => {
    const row = document.createElement('div');
    row.classList.add('cart__container-prod-totals');

    row.innerHTML = `
      <div>${product.title}</div>
      <div>${product.subtotal.toFixed(2)}${shoppingCart.getCurrency()}</div>
    `;

    container.appendChild(row);
  });

  document.querySelector('.cart__container-cart-total-sum p + p').innerHTML =
    total.toFixed(2) + shoppingCart.getCurrency();
};

function bindEvents() {
  //Change Quantity
  const quantityCells = document.querySelectorAll('.cart__container-qty');

  quantityCells.forEach((cell, index) => {
    let quantity = cell.querySelector('.cart__container_product-quantity');

    quantity.addEventListener('input', () => {
      //Limit to protect Resellerslue
      if (quantity.value >= 0 && quantity.value <= 50) {
        updateQuantity(cell, +quantity.value, index);
      } else {
        alert('Cantidad Invalida o solo puedes comprar hasta 50 unidades');
      }
    });

    cell.addEventListener('click', (evt) => {
      if (evt.target.classList.contains('cart__container__minus')) {
        const updatedMinusQuantity = parseInt(quantity.value) - 1;
        //Prevents Negative Numbers
        if (updatedMinusQuantity >= 0) {
          quantity.value = updatedMinusQuantity;
          updateQuantity(cell, +quantity.value, index);
        } else {
          alert('Cantidad Invalida o solo puedes comprar hasta 50 unidades');
        }
      } else if (evt.target.classList.contains('cart__container__plus')) {
        const updatedPlusQuantity = parseInt(quantity.value) + 1;
        //Limit to protect Resellers
        if (updatedPlusQuantity <= 50) {
          quantity.value = updatedPlusQuantity;
          updateQuantity(cell, +quantity.value, index);
        } else {
          alert('Cantidad Invalida o solo puedes comprar hasta 50 unidades');
        }
      } else {
        console.log('No Click action');
      }
    });
  });
}

const removeQty = document.querySelector('#qty-delete');
console.log('QTY Image', removeQty);
removeQty.addEventListener('click', () => {
  document
    .querySelectorAll('.cart__container_product-quantity')
    .forEach((input) => (input.value = '0'));
  shoppingCart.removeAllProducts();
  updateTotals();
});

let shoppingCart;

document.addEventListener('DOMContentLoaded', () => {
  //Gets Products from JSON API
  const productCartAPIResponse = new ProductCartAPI(
    'https://jsonblob.com/api/jsonBlob/1108553464899977216'
  );

  productCartAPIResponse
    .fetchData()
    .then((data) => {
      //New Instance of Shopping Cart
      shoppingCart = new ShoppingCart(data.products, data.currency);
      //Calls build Cart Method and passes Products
      buildCartProducts(data.products);
    })
    .catch((error) => {
      console.error('Error:', error);
    });
});
