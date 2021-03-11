@extends('layouts.app')

@section('page-title', 'Buy products online with great discount')

@section('content')


    <!-- TOP NAV BAR-END -->
    <!--MOTTO AREA-->
    <section id="mottoArea" class="d-none d-sm-block">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="mottoBuy text-center">
                        <a href=""></a><img src="{{asset('images/roundShape.png')}}"
                                            class="img-fluid mx-auto d-block" alt=""></a>
                        <div class="card-img-overlay">
                            <h1><a href=""><strong><em>Buy</em></strong></a></h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="motto text-center">
                        <a href=""><img src="{{asset('images/motto2.png')}}" class="img-fluid mx-auto d-block"
                                        alt=""></a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="mottoSale text-center">
                        <a href=""><img src="{{asset('images/roundShape.png')}}"
                                        class="img-fluid mx-auto d-block" alt=""></a>
                        <div class="card-img-overlay">
                            <h1><a href=""><strong><em>Sale</em></strong></a></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


  {{-- carousel --}}
  <div id="mainBanner" class="carousel slide main-banner" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#mainBanner" data-slide-to="0" class="active"></li>
      <li data-target="#mainBanner" data-slide-to="1"></li>
      <li data-target="#mainBanner" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      
      @foreach($carousels as $index => $carousel)
      <div class="carousel-item {{$index == 1 ? 'active' : ''}}">
        <img class="d-block w-100" src="{{asset($carousel->img)}}" alt="First slide">
      </div>
      @endforeach
     
    </div>
    <a class="carousel-control-prev" href="#mainBanner" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#mainBanner" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
  {{-- flash sale --}}
  @if($flashSaleProducts->count())
  <section class="just-for-you-section container-fluid h-100 my-4">
            <div class="headline text-center">
                <br><h2 class="img-custom-logo mt-4 text-white"><a href=""><strong>Flash Sale</strong></a></h2>
            </div>

    <div class="row h-100 mt-5">

      @foreach($flashSaleProducts as $item)
      <div class="col-6 col-sm-4 col-md-2 p-2">
        <div class="card shadow-hover h-100" >
          <img src="{{asset($item->product->productImage->first()->original)}}" class="card-img-top" alt="">
          <div class="card-body ">
            <p class="product-title">{{substr($item->product->title,0,25)}}..</p>
            <button class="btn btn-info btn-sm disabled">{{(($item->product->price-$item->flash_price)/$item->product->price*100)}}% OFF</button>
            <br>
            <small class="line-through">Tk. {{number_format($item->product->price)}}</small>
            <p class="product-price">Tk. {{number_format($item->flash_price)}}</p>
          </div>
          <form action="{{route('directBuy.order')}}" method="POST">
            @csrf
            <input type="hidden" name="id" value="{{$item->id}}">
            <button class="btn btn-sm btn-block" style="background-image: radial-gradient(#F18B24 15%, #D45E45 100%);font-size: 20px;color: white;">Buy now</button>
          </form>
        </div>
      </div>
      @endforeach
  
    </div>
  </section>
  @endif

  {{-- categories-section --}}
  <section class="categories-section container my-4 h-100">
    <div class="headline text-center">
                <h2 class="img-custom-logo mt-4"><a href=""><strong>Categories</strong></a></h2>
            </div>
      <div class="row h-100">
@foreach($navbarCategories as $category)
@foreach($category->subCategory as $item)

        <div class="col-6 col-sm-4 col-md-2 p-2">
          <a href="{{'/catalog?filter[subCategory]='.$item->subCategory_name}}">
            <div class="card shadow-hover">
              <div class="card-body">
                <img src="{{ asset('/storage'.'/'.$item->logo) }}" class="img-fluid" alt="">
                <p class="card-title text-center" style="color: black">
                {{$item->subCategory_name}}</p>
              </div>
            </div>
          </a>
        </div>

@endforeach
@endforeach
{{--        
        <div class="col-6 col-sm-4 col-md-2 p-2">
          <a href="{{'catalog?filter[subCategory]=Mobile'}}">
            <div class="card shadow-hover">
              <div class="card-body">
                <img src="{{asset('images/demo/electronics.jpg')}}" class="img-fluid" alt="">
                <p class="card-title text-center" style="color: white">Electronics</p>
              </div>
            </div>
          </a>
        </div>
        
        <div class="col-6 col-sm-4 col-md-2 p-2">
          <a href="{{'catalog?filter[subCategory]=Furniture'}}">
            <div class="card shadow-hover">
              <div class="card-body">
                <img src="{{asset('images/demo/home.jpg')}}" class="img-fluid" alt="">
                <p class="card-title text-center">Home Lifestyle</p>
              </div>
            </div>
          </a>
        </div>
        
        <div class="col-6 col-sm-4 col-md-2 p-2">
          <a href="{{'catalog?filter[subCategory]=Diapers'}}">
            <div class="card shadow-hover">
              <div class="card-body">
                <img src="{{asset('images/demo/baby.jpg')}}" class="img-fluid" alt="">
                <p class="card-title text-center">Baby</p>
              </div>
            </div>
          </a>
        </div>
        
        <div class="col-6 col-sm-4 col-md-2 p-2">
          <a href="{{'catalog?filter[subCategory]=Mens'}}">
            <div class="card shadow-hover">
              <div class="card-body">
                <img src="{{asset('images/demo/sport.jpg')}}" class="img-fluid" alt="">
                <p class="card-title text-center">Sport & outdoor</p>
              </div>
            </div>
          </a>
        </div>
        
        <div class="col-6 col-sm-4 col-md-2 p-2">
          <a href="{{'catalog?filter[subCategory]=Kitchen'}}">
            <div class="card shadow-hover">
              <div class="card-body">
                <img src="{{asset('images/demo/kitchen.jpg')}}" class="img-fluid" alt="">
                <p class="card-title text-center">Kitchen</p>
              </div>
            </div>
          </a>
        </div>
        
        <div class="col-6 col-sm-4 col-md-2 p-2">
          <a href="{{'catalog?filter[subCategory]=Pet'}}">
            <div class="card shadow-hover">
              <div class="card-body">
                <img src="{{asset('images/demo/pet.jpg')}}" class="img-fluid" alt="">
                <p class="card-title text-center">Pets</p>
              </div>
            </div>
          </a>
        </div>
--}}
      </div>
    </div>
  </section>

  {{-- just for you --}}
  <section class="just-for-you-section container h-100 my-4">
    <div class="headline text-center">
                <h2 class="img-custom-logo mt-4"><a href=""><strong>All Items</strong></a></h2>
            </div>
    <div class="row h-100">
      @foreach($newProducts as $product)
      <div class="col-6 col-sm-4 col-md-2 p-2">
        <a href="{{$product->path()}}">
        <div class="card shadow-hover h-100" >
          <img src="{{asset($product->productImage->first()->original)}}" class="card-img-top" alt="">
          <div class="card-body ">
            <p class="product-title">{{substr($product->title,0,35)}}..</p>

            @if($product->onSale)
              <small class="line-through text-dark">Tk. {{$product->price}}</small>
              <p class="product-price">Tk.{{number_format($product->sale_price)}}</p>
            @else
              <p class="product-price">Tk.{{number_format($product->price)}}</p>
            @endif
            
            <small class="text-green">Available Product: <b>{{$product->stock}}</b> </small>
          </div>
        </div>
        </a>
      </div>
      

      @endforeach
  
    </div>
  
    <div class="d-flex justify-content-center mt-5">
      <div class="text-center">
        <h2>Didn't Find Your Match</h2>
        <a href="{{route('shop.catalog')}}" class="btn btn-orange">Search for It</a>
      </div>
    </div>
  </section>
  
@endsection