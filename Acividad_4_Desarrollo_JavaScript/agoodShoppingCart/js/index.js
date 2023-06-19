import { ProductCartAPI } from './productCartAPI.js';
// });
import { ShoppingCart } from './shoppingCart.js';

//HTML Bulid Functions
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

console.log();

function buildCartProducts(products) {
  const cartContainerProducts = document.querySelector(
    '.cart__container-products'
  );
  console.log(cartContainerProducts);

  const table = document.querySelector(
    '.cart__container-products__table tbody'
  );

  //Loops through Products and Build Cart
  products.forEach(({ SKU, title, price }) => {
    const row = document.createElement('tr');

    // Cells
    const cellImage = document.createElement('td');
    const cellProduct = document.createElement('td');
    const cellPrice = document.createElement('td');
    const cellQuantity = document.createElement('td');
    const cellTotal = document.createElement('td');

    cellPrice.innerText = `${price}`;
    cellProduct.innerText = `${title} - ${SKU}`;
    cellQuantity.innerHTML = `<button class="cart__container__img"><img src='../img/logos/MinusCircle.GIF' width="20px" height="20px"></button><input type="number" data-sku="${SKU}" class="product-price" value="1"><button class="cart__container__img"><img src='../img/logos/PlusCircle.GIF' width="20px" height="20px"></button>`;
    cellTotal.innerText = price;
    //Append Elements
    row.appendChild(cellImage);
    row.appendChild(cellProduct);
    row.appendChild(cellQuantity);
    row.appendChild(cellPrice);
    row.appendChild(cellTotal);

    table.appendChild(row);
  });

  /*const cartContainerProductsDiv = createDiv(
      cartContainerProducts,
      'cart__container-products-cart'
    );*/
  //   const prodImgInfo = getImgInfo(product);
  //Image

  // createImg(
  //   createDiv(cartContainerProductsDiv, ''),
  //   prodImgInfo.src,
  //   'cart__container_products_image',
  //   '40px',
  //   '50px',
  //   prodImgInfo.alt
  // );

  // createP(
  //   createDiv(cartContainerProductsDiv, ''),
  //   'cart__container-products_title',
  //   `${product.title}-${product.SKU}`
  // );

  // //createInputQuantity(parent, product);
  // // //Quantity
  // const cart_product_plus_icon = document.createElement('img');
  // cart_product_plus_icon.src = '../img/logos/PlusCircle.GIF';
  // cart_product_plus_icon.alt = 'Add Product';
  // cartContainerProductsDiv.appendChild(cart_product_plus_icon);
  // const cart_product_qty_input = document.createElement('input');
  // cart_product_qty_input.type = 'number';
  // cartContainerProducts.appendChild(cart_product_qty_input);
  // const cart_product_minus_icon = document.createElement('img');
  // cart_product_minus_icon.src = '../img/logos/MinusCircle.GIF';
  // cart_product_minus_icon.alt = 'Remove Product';
  // cartContainerProductsDiv.appendChild(cart_product_minus_icon);
  //});
}

const productCartAPIResponse = new ProductCartAPI(
  'https://jsonblob.com/api/jsonBlob/1108553464899977216'
);

productCartAPIResponse.fetchData().then((data) => {
  const shoppingCart = new ShoppingCart(data.products);
  //console.log(shoppingCart.displayProductsInfo());
  /*console.log(shoppingCart.getProduct('0K3QOSOV4V'));
  console.log(shoppingCart.getProductSKU('Funda de piel'));
  console.log(shoppingCart.getCartSize());
  console.log(shoppingCart.getAllProductSKUs(data));
  console.log(shoppingCart.getAllProducts(data));*/
  buildCartProducts(data.products);
});
