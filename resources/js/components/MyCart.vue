<template>

  <div class="card shadow">
    <div class="card-header bg-light border-bottom">
      <p class="mb-0">My Cart</p>
    </div>

    <div class="card-body" v-if="cartItems.length">
      <div class="row">
        <div class="col-12 bg-light">
          <div class="d-flex justify-content-between">
            <p>Select items</p>
            <div>
              <button type="submit" class="btn" @click.prevent="deleteCart">
                <span
                  class="spinner-grow spinner-grow-sm"
                  role="status"
                  aria-hidden="true"
                  v-if="deleteLoading"
                ></span>
                <i class="fas fa-trash-alt text-dark"></i>
              </button>
            </div>
          </div>
        </div>

        <div
          class="col-12 mb-2 bg-light"
          v-for="cartItem in cartItems"
          :key="cartItem.id"
        >
          <div class="d-flex justify-content-between">
            <div class="row pt-4 pb-2">
              <div class="col-md-1 col-1">
                <input
                  type="checkbox"
                  @change="cartSelect(cartItem.id, $event)"
                  :value="'selector-' + cartItem.id"
                />
              </div>

              <div class="col-md-1 col-2">
                <img
                  :src="cartItem.product.get_image[0].original"
                  class="img-fluid"
                  alt="Product"
                />
              </div>

              <div class="col-md-4 col-9">
                <a
                  :href="
                    'shop/' + cartItem.product.id + '-' + cartItem.product.slug
                  "
                  target="_blank"
                >
                  <p class="text-grey-800">{{ cartItem.product.title }}</p>
                </a>
              </div>

              <div class="col-md-2 col-6 mt-sm-2 mt-md-0">
                <p class="text-orange h5">
                  Tk.{{
                    cartItem.product.onSale
                      ? cartItem.product.sale_price
                      : cartItem.product.price
                  }}
                </p>
              </div>

              <div class="col-md-2 col-6">
                <div class="d-flex small">
                  <button
                    @click="cartDecrement(cartItem.id)"
                    class="btn btn-outline-primary px-3"
                  >
                    -
                  </button>
                  <input
                    type="text"
                    :id="cartItem.id"
                    :value="cartItem.quantity"
                    placeholder="1"
                    class="pl-3 border"
                    disabled
                    style="width: 50px"
                  />
                  <button
                    @click="cartIncrement(cartItem.id)"
                    class="btn btn-outline-primary px-3"
                  >
                    +
                  </button>
                </div>

              </div>
            </div>
          </div>

        </div>
      </div>

      <hr class="my-4" />
      <h6
        class="heading-small text-muted mb-4 text-right"
        id="password-section"
      >
        Order Summary<br>
        <span>Include 100Tk. Shipping Cost</span>
      </h6>
      <div class="pl-lg-4">
        <div class="row mb-3">
          <div class="col-12 col-sm-12 col-md-4 ml-auto">
            <div class="d-flex justify-content-between">
              <div>
                <p>Total:</p>
              </div>
              <div>
                <p class="h5 text-orange">Tk.{{ cartTotalPrice }}</p>
              </div>
            </div>
            <button v-if="check"
              class="btn btn-block btn-primary"
              data-toggle="modal"
              data-target="#checkoutModal"
    data-backdrop="static"
data-keyboard="false"
              @click.prevent="proceedToCheckout"
            style="background-image: radial-gradient(#F18B24 15%, #D45E45 100%);">
              Proceed to checkout
            </button>
          </div>
        </div>
<div class="col-md-12 checkout" style="float:left;">

<div class="row payment-options">
  <button class="btn selected" v-if="cash" @click="fub">Cash On Delivery</button>
  <button class="btn"  v-if="bik"  data-backdrop="static"
data-keyboard="false" @click="show">bKash</button>


<div class="col-md-3" style="float:left;">
  <div class="mx-auto " ref="paypal">
</div>

<div class="col-md-6" style="float:left;">
  <button class="btn btn-primary" style="width:200px;" v-if="paypla" @click="setLoaded()" > Paywith Paypal</button>
</div>

</div>
</div>
  </div>
      </div>
    </div>
    <empty-cart v-else></empty-cart>










<div class="modall" style="position:fixed" v-if="bikashm">
<div class="modalContentl">


<form method="POST" @submit.prevent="save">
      <div class="modalheaderl" style=" background-image: radial-gradient(#F18B24 15%, #D45E45 100%);">

        <h4 class="modal-title" id="exampleModalLongTitle">Pay with bKsah</h4>
        <button type="button" class="close" @click="bikashm=false">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modalbodyll">

<h6>
                Enter your:
                <span class="text-orange"> bKash Transaction Number</span>
              </h6>
      <input type="text" name="bikash" v-model="bikash.number" placeholder="Enter Your Transaction Mobile Number" style="width: 280px;">
<h6 class="mt-3">
                Enter your:
                <span class="text-orange" > Transaction Id</span>
              </h6>
      <input type="text" name="bikash" v-model="bikash.trans" placeholder="Enter Your Transaction ID" style="width: 280px;">


      </div>
      <div class="modalfooterl">
        <button type="button" class="btn btn-secondary" @click="bikashm=false">Close</button>
        <button type="submit" class="btn btn-primary" style="background-image: radial-gradient(#F18B24 15%, #D45E45 100%);">Pay with bKash</button>

      </div>
</form>
</div>
</div>

    <div
      class="modal fade"
      id="checkoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="checkoutModalTitle"
      aria-hidden="true"
     v-if="all"
   ref="vuemodal" :click-to-colse="false">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" >
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Place order</h5>
       
          </div>
          <form action="/order" method="POST"  ref="frm">
<input type="hidden" name="_token" :value="csrf" />
<input type="hidden" name="method" :value="payment.method">
            <div class="modal-body" v-for="modalProduct in modalProduct"
          >

              <h5>Product name: {{ modalProduct.product.title }}</h5>
              <h6>Product quantity: {{ modalProduct.quantity }}</h6>
              
              <input
                type="hidden"
                name="cart_id[]"
                :value="modalProduct.id"
              />
              <input
                type="hidden"
                name="quantity"
                :value="modalProduct.quantity"
              />
              <h6>
                Product price:
                <span class="text-orange">Tk. {{modalProduct.product.onSale
                      ? modalProduct.product.sale_price
                      : modalProduct.product.price}}</span>
              </h6>
              <h6>
                Shipping cost:
                <span class="text-orange">Tk. 100</span>
              </h6>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-dismiss="modal" @click="clear"
              >
                Close
              </button>
              <button type="submit" class="btn text-white" style="background-image: radial-gradient(#F18B24 15%, #D45E45 100%);">
                Place order now
              </button>
            </div>
          </form>
       </div>
      </div>
    </div>
  </div>
</template>

<script>
import EmptyCart from "./EmptyCart";


export default {
  name: "my-cart",

  data() {
    return {
paypalbutton:true,
loaded:false,
paypla:true,
  check:false,
bikashm:false,
cash:true,
bik:true,
      cartItems: [],
      selectedCart: [],
      cartTotalPrice: 0,
   modelcontent:[],
      modalProduct:[],
    payment:{
method:""
},

bikash:{
number:"",
trans:"",

},
paypalfun(){
this.paypalbutton=true;
this.paypla=false;

},
showmodal(){
console.log(this.$refs);
},

  
      
       
      all:true,
      showModal: false,
      deleteLoading: false,
      csrf: document
        .querySelector('meta[name="csrf-token"]')
        .getAttribute("content"),
    };
  },
  components: {
    EmptyCart,
    
  },
  mounted() {

    this.getCartItems();

const script = document.createElement("script");
    script.src =
      "https://www.paypal.com/sdk/js?client-id=AbW13FPpv3YZH46ZJ3X0ZCmm1Dux2JFswhtQbV2fJU-fafPfsPYUtaQai771V9LSRibG4v-gdsis7Iya";
   
    document.body.appendChild(script);


  },
  methods: {

    getCartItems() {
      axios
        .get("/cart/api/all")
        .then((res) => res.data)
        .then((data) => {
          this.cartItems = data;
console.log(data);
        })
        .catch((e) => console.log(e));
    },
 setLoaded: function(resp) {
  if (this.selectedCart.length == 0) {
        alert("Please select exactly one item to checkout");
        this.showModal = false;
        return;
      }else{
this.bik=false
this.cash=false
var i;
       for(var i=0;i<this.selectedCart.length;i++){
      const cart = this.cartItems.find(
        (cart) => cart.id === this.selectedCart[i]
      );

 this.modalProduct.push(cart);
}
this.payment.method="paypal"
this.paypla=false;
      this.loaded = true;
      window.paypal
        .Buttons({
          createOrder: (data, actions) => {
            return actions.order.create({
              purchase_units: [
                {
          
                  amount: {
                    currency_code: "USD",
                    value: this.cartTotalPrice
                  }
                }
              ]
            });
          },
          onApprove: async (data, actions, resp) => {
            this.loadding = true;
            const order = await actions.order.capture();
            this.data;
            this.paidFor = true;
            this.loadding = false;
             this.payment.method="paypal";
           
this.$refs.frm.submit();
       
          },
          onError: err => {
            console.log(err);
         alert('Select one item');
          }
        })
        .render(this.$refs.paypal);

}

},

fub(){
  if (this.selectedCart.length == 0) {
        alert("Please select exactly one item to checkout");
        this.showModal = false;
        return;
      }
this.bik=false
this.paypla=false
this.payment.method="cash"
console.log(this.payment.method)
 this.check=true;
},
show(){
if (this.selectedCart.length == 0) {
        alert("Please select exactly one item to checkout");
        this.showModal = false;
        return;
      }else{
this.payment.method="bikash"
this.cash=false
this.paypla=false
var i;
       for(var i=0;i<this.selectedCart.length;i++){
      const cart = this.cartItems.find(
        (cart) => cart.id === this.selectedCart[i]
      );

 this.modalProduct.push(cart);



  
 

}
this.bikashm=true


}

},
clear(){
this.modalProduct.push("");

},
save(){
var input=this.bikash;
if(input['number']=="" || input['trans']==""){
     alert('please fill up input field');
}else{
   axios.post('/save',input)
                      .then((res) => res.data)
        .then((data) => {
this.$refs.frm.submit();
            console.log(data)

input.number=""
input.trans=""
this.bikashm=false
           this.payment.method="bikash"

                
                      });

} 
},
    //select function
    cartSelect(cartId, e) {
      let newCart = this.cartItems.find((cart) => cart.id === cartId);
      if (!e.target.getAttribute("checked")) {
        if (newCart.product.onSale) {
          this.cartTotalPrice += Number(
            (newCart.product.sale_price * newCart.quantity)+100
          );
        } else {
          this.cartTotalPrice += Number(
            (newCart.product.sale_price * newCart.quantity)+100
          );
        }

        //selection of item
        this.selectedCart.push(newCart.id);
        e.target.setAttribute("checked", "true");
      } else {
        if (newCart.product.onSale) {
          this.cartTotalPrice -= Number(
            (newCart.product.sale_price * newCart.quantity)+100
          );
        } else {
          this.cartTotalPrice -= Number(
            (newCart.product.sale_price * newCart.quantity)+100
          );
        }

        this.selectedCart = this.selectedCart.filter((cart) => cart !== cartId);
        e.target.removeAttribute("checked");
      }
    },

    deleteCart() {
      this.deleteLoading = true;
      if (this.selectedCart.length < 1) {
        alert("Please select atleast one item.");
        return;
      }

      axios
        .post("/cart/destroy/selected", { cart: this.selectedCart })
        .then((res) => res.data)
        .then((data) => {
          this.getCartItems();
          this.deleteLoading = false;
          this.selectedCart = [];
          this.cartTotalPrice = 0;
        })
        .catch((e) => {
          console.log(e);
          this.getCartItems();
          this.selectedCart = [];
          this.deleteLoading = false;
        });
    },

    cartIncrement(cartId) {
      const cartItem = this.cartItems.find((cart) => cart.id === cartId);
      if (cartItem.quantity < cartItem.product.stock && cartItem.quantity < 5) {
        cartItem.quantity += 1;

        if (this.selectedCart.includes(cartId)) {
          if (cartItem.product.onSale) {
            this.cartTotalPrice += Number(cartItem.product.sale_price);
          } else {
            this.cartTotalPrice += Number(cartItem.product.price);
          }
        }
      } else {
        alert("Max reached");
      }
    },
    cartDecrement(cartId) {
      const cartItem = this.cartItems.find((cart) => cart.id === cartId);
      if (cartItem.quantity > 1) {
        cartItem.quantity -= 1;
        if (this.selectedCart.includes(cartId)) {
          if (cartItem.product.onSale) {
            this.cartTotalPrice -= Number(cartItem.product.sale_price);
          } else {
            this.cartTotalPrice -= Number(cartItem.product.price);
          }
        }
      }
    },
    proceedToCheckout() {
      if (this.selectedCart.length == 0) {
        alert("Please select exactly one item to checkout");
        this.showModal = false;
        return;
      }
      this.showModal = true;
var i;
       for(var i=0;i<this.selectedCart.length;i++){
      const cart = this.cartItems.find(
        (cart) => cart.id === this.selectedCart[i]
      );

  this.modalProduct.push(cart);
  console.log(this.modalProduct);


 

}

    },
  }
}
</script>

<style scoped>
   .modall{
                postion:fixed;
                top:0;
                bottom:0;
                left:0;
                right:0;
    transform: translate(0%, 20%);
            
            }
            .modalContentl{
                width:550px;
                background:#fff;
                margin-top:99px;
                margin-left:auto;
                margin-right:auto;
            }
            .modalheaderl{
                background:#efefef;
                font-weight:bold;
                padding:16px 9px;
                color:#505050;
                
            }
           .modalbodyll{
                  padding:22px;
                background:#fff;
              
              min-height: 222px;
color:red;
            }
            .modalfooterl{
                background:#D1D1D1;
                font-weight:bold;
                padding:9px;
                color:#505050;
}
                  .close:hover{
                background:85454;
            }
.col{
float:left}

.payment-options{
  margin:50px 0px 20px 15px;
}
.payment-options button{
  border-radius: 27px;
   padding: 5px 20px;
   background: transparent;
   color: #000063;
   border: 1px solid #0f89c5;
   margin-right:10px;
   -webkit-transition: all .2s ease-out;
   -o-transition: all .2s ease-out;
   transition: all .2s ease-out;
}
.payment-options button:hover,
.payment-options button:focus,
.payment-options button:active{
  background-image: radial-gradient(#F18B24 15%, #D45E45 100%);
  color: #fff;
  box-shadow: none;
  outline: 0;
}
.payment-options button.selected{
  background-image: radial-gradient(#F18B24 15%, #D45E45 100%);
  color: #fff;
}
</style>