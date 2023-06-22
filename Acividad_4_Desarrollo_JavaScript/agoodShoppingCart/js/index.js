import { ProductCartAPI } from './productCartAPI.js';
import { ShoppingCart } from './shoppingCart.js';

//HTML Build Functions
function createDiv(parent, classes) {
  const div = document.createElement('div');
  if (classes) {
    div.classList.add(classes);
  }
  parent.appendChild(div);
  return div;
}

function createP(parent, classes, content) {
  const p = document.createElement('p');
  if (classes) {
    p.classList.add(classes);
  }
  p.textContent = content;
  parent.appendChild(p);
}

function createImg(parent, src, classes, width, height, alt) {
  const img = document.createElement('img');
  img.style.width = width;
  img.style.height = height;
  img.src = src;
  if (classes) {
    img.classList.add(classes);
  }
  img.alt = alt;
  parent.appendChild(img);
  return img;
}

function getImgInfo(product) {
  let imgSrc = '';
  let imgAlt = '';
  //console.log(`Prod Image ${prod_img}`);
  if (product.SKU === '0K3QOSOV4V') {
    imgSrc = '../img/fotos/iPhone13_Pro.jpg';
    imgAlt = 'iPhone13 Pro';
  } else if (product.SKU === 'TGD5XORY1L') {
    imgSrc = '../img/fotos/usb_charger.jpg';
  } else if (product.SKU === 'IOKW9BQ9F3') {
    imgSrc = '../img/fotos/leather_case.jpg';
  } else {
    imgSrc = '../img/fotos/NoImage.jpg';
  }

  return { src: imgSrc, alt: imgAlt };
}

function createInput(parent, classes, type) {
  const input = document.createElement('input');
  if (classes) {
    input.classList.add(classes);
  }
  input.type = type;
  parent.appendChild(input);
}

function buildCartProducts(products) {
  const cartContainerProducts = document.querySelector(
    '.cart__container-products'
  );
  //console.log(cartContainerProducts);

  const table = document.querySelector(
    '.cart__container-products__table tbody'
  );

  //Loops through Products and display Products from API
  console.log(products);
  products.forEach(({ SKU, title, price }) => {
    //TRs for API Products
    const row = document.createElement('tr');

    // Cells
    const cellImage = document.createElement('td');
    cellImage.classList.add('cart__container-product-img');
    const cellProduct = document.createElement('td');
    const cellPrice = document.createElement('td');
    const cellQuantity = document.createElement('td');
    cellQuantity.classList.add('cart__container-qty');
    const cellTotal = document.createElement('td');

    cellPrice.innerText = `${price}${shoppingCart.getCurrency()}`;
    cellProduct.innerText = `${title} - ${SKU}`;
    cellQuantity.innerHTML = `<button class="cart__container__minus">
                              <img src='../img/logos/MinusCircle.GIF' width="20px" height="20px">
                              </button>
                              <input type="number" data-sku="${SKU}" id="qty" class="cart__container_product-quantity" min="0" value="0">
                              <button class="cart__container__plus">
                              <img src='../img/logos/PlusCircle.GIF' width="20px" height="20px">
                              </button>`;
    //Append Elements
    //row.appendChild(cellImage);
    //const prodImage = document.querySelector('.cart__container-product-img');

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
    row.classList.add('flex');

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

    quantity.addEventListener('input', () =>
      updateQuantity(cell, +quantity.value, index)
    );

    cell.addEventListener('click', (evt) => {
      if (evt.target.classList.contains('cart__container__minus')) {
        console.log('Minus Event');
        const updatedMinusQuantity = parseInt(quantity.value) - 1;
        quantity.value = updatedMinusQuantity;
        updateQuantity(cell, +quantity.value, index);
      } else if (evt.target.classList.contains('cart__container__plus')) {
        const updatedPlusQuantity = parseInt(quantity.value) + 1;
        quantity.value = updatedPlusQuantity;
        console.log('Plus Event');
        updateQuantity(cell, +quantity.value, index);
      } else {
        // ...
      }
    });
  });
}

let shoppingCart;

document.addEventListener('DOMContentLoaded', () => {
  const productCartAPIResponse = new ProductCartAPI(
    'https://jsonblob.com/api/jsonBlob/1108553464899977216'
  );

  productCartAPIResponse
    .fetchData()
    .then((data) => {
      shoppingCart = new ShoppingCart(data.products, data.currency);
      buildCartProducts(data.products);
    })
    .catch((error) => {
      console.error('Error:', error);
    });
});
