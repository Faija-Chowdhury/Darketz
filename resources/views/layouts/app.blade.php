<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    {{-- <title>{{ config('app.name')}}</title> --}}
    <title>@yield('page-title')</title>

    <link rel="shortcut icon" type="image/png" href="{{asset('logo.png')}}" />
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <!-- Styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">    
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    @stack('css')
</head>
<style type="text/css">
  
  .header-main {
    background-image: radial-gradient(#F18B24 15%, #D45E45 100%);
    position: relative;
    padding-top: 45px;
    padding-bottom: 15px;
}
.navbar{
    background-color: black !important;
    font-size: 20px;
    color:white !important;
}
.navbar-main a{
    color: white !important;
    background-color: black !important;
}
.img-custom-logo{
    background-image: url("{{asset('images/overpad.png')}}");
    background-position: center; /* Center the image */
    background-repeat: no-repeat; /* Do not repeat the image */
    height: 62px;
}

#ex4 .p1[data-count]:after{
  position:absolute;
  right:10%;
  top:8%;
  content: attr(data-count);
  font-size:40%;
  padding:.2em;
  border-radius:50%;
  line-height:1em;
  color: white;
  background:rgba(255,0,0,.85);
  text-align:center;
  min-width: 1em;
}




/* ::: Checkout Section ::: */
#checkout{
  min-height: 100vh;
  background: #eee;
  padding: 0px 250px 100px;
}

#checkout .cart-wrapper{
  padding:0px 35px;
}
#checkout .cart-tatals{
    padding:20px 0px 0px;
}
.checkout{
  min-height: 550px;
}
.checkout-info{
  padding:40px 200px 20px;
  min-height: 100vh;
  background: #eee;
}

.checkout-info .t-center{
  margin:20px 0px;
}
.checkout-info .shipping{
  margin-top:40px;
}

#card-name{
  text-transform: uppercase;
}
#checkout .table .dish-name-body,
.cart-wrapper .table .dish-name-body{
    padding: 0px;
}
#checkout .table .dish-name-body p,
.cart-wrapper .table .dish-name-body p{
  font-weight:600;
}

#checkout .notice{
  font-size:17px;
  color: #000;
  margin:10px 0px 15px;
}
#checkout .notice span{
  font-weight:600
}



/* ::: Checkout Section 
  --> Forms for Bkash, Card and Cash On Delivery 
::: */

#form-bkash,
#form-card{
  display: none;
}
.checkout{
  min-height:500px;
}



nav {    
  display: block;
  text-align: center;
}
nav ul {
  margin: 0;
  padding:0;
  list-style: none;
}
.nav a {
  display:block; 
  background: #111; 

  text-decoration: none;
  padding: 0.8em 1.8em;
  text-transform: uppercase;
  font-size: 80%;
  letter-spacing: 2px;

  position: relative;
}
.nav{  
  vertical-align: top; 
  display: inline-block;

  border-radius:6px;
}
.nav li {
  position: relative;
}
.nav > li { 
  float: left; 
  margin-right: 1px; 
} 
.nav > li > a { 
  margin-bottom: 1px;

}
.nav > li:hover, 
.nav > li:hover > a { 
 
}
.nav li:hover > a { 

}
.nav > li:first-child { 
  border-radius: 2px 0 0 4px;
} 
.nav > li:first-child > a { 
  border-radius: 4px 0 0 0;
}
.nav > li:last-child { 
  border-radius: 0 0 4px 0; 
  margin-right: 0;
} 
.nav > li:last-child > a { 
  border-radius: 0 4px 0 0;
}
.nav li li a { 
  margin-top: 1px;
}
.nav li a:first-child:nth-last-child(2):before { 
  content: ""; 
  position: absolute; 
  height: 0; 
  width: 0; 
  border: 5px solid transparent; 
  top: 50% ;
  right:5px;  
 }
 /* submenu positioning*/
.nav ul {
  position: absolute;
  white-space: nowrap;
  z-index: 1;
  left: -99999em;
}
.nav > li:hover > ul {
  left: auto;
  margin-top: 0px;
  min-width: 100%;
}
.nav > li li:hover > ul { 
  left: 100%;
  margin-left: 1px;
  top: -1px;
}
/* arrow hover styling */
.nav > li > a:first-child:nth-last-child(2):before { 
  border-top-color: #aaa; 
}
.nav > li:hover > a:first-child:nth-last-child(2):before {
  border: 5px solid transparent; 
  border-bottom-color: orange; 
  margin-top:-5px
}
.nav li li > a:first-child:nth-last-child(2):before {  
  border-left-color: #aaa; 
  margin-top: -5px
}
.nav li li:hover > a:first-child:nth-last-child(2):before {
  border: 5px solid transparent; 
  border-right-color: orange;
  right: 10px; 
}
</style>
<body>
    <div class="loader-svg" id="loaderSvg">
        <img src="{{asset('images/loading/loading.svg')}}" alt="">
    </div>

    <div id="app">
        @include('inc.app.navigation-bar')
        @yield('content')
        @include('inc.app.footer')
    </div>
    
     
    @include('sweetalert::alert')
      <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD" data-sdk-integration-source="button-factory"></script>
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/shop.js') }}"></script>
    @stack('js')

</body>
</html>
