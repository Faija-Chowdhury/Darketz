@guest
<section class="top-banner bg-light my-0 py-2">
  <div class="container-fluid">
      <ul class="top-banner-list small">
        <li>
          <a href="call:4222022">Call us:+4222022</a>
        </li>
        <li>
          <a href="{{route('register')}}">Sign up</a>
        </li>
        <li>
          <a href="{{route('login')}}">Login</a>
        </li>
        <li class="active">
          <a href="{{route('myOrder.index')}}">Track my order</a>
        </li>
      </ul>
  </div>
</section>
@endguest

@auth
<section class="top-banner bg-light my-0 py-2">
  <div class="container-fluid">
      <ul class="top-banner-list small">
        <li>
          <a href="call:4222022">Call us:+4222022</a>
        </li>
        <li class="active">
          <a href="{{route('myOrder.index')}}">Track my order</a>
        </li>
      </ul>
  </div>
</section>
@endauth

<header class="section-header sticky-top my-0 py-0">
  <section class="header-main border-bottom">
      <div class="container">
          <div class="row align-items-center">
              <div class="col-lg-3 col-sm-6 col-md-3 col-5"> 
                <a href="{{route('shop.index')}}" class="brand-wrap" data-abc="true">
                       <img class="logo" width="120px" src="{{asset('images/logo.png')}}" style="margin-left: -55px">
                </a> </div>
              <div class="col-lg-6 col-sm-8 col-md-6  col-xl-5  d-none d-md-block">
                  <form action="{{route('shop.catalog')}}" class="search-wrap">
                    @csrf
                      <div class="input-group w-100"> 
                      <input type="text" class="form-control search-form" name="filter[title]" placeholder="Search">
                          <div class="input-group-append" > 
                            <button type="submit" class="btn btn-primary search-button" style="background-image: radial-gradient(#F18B24 15%, #D45E45 100%);"> <i class="fa fa-search"></i> 
                            </button> 
                          </div>
                      </div>
                  </form>
              </div>
              <div class="col-lg-3 col-sm-6 col-md-3 col-xl-4 col-7">
                  <div class="d-flex justify-content-end">
                    <div id="ex4">
                    <a class="nav-link nav-user-img text-white" href="{{route('cart.index')}}">

                    @auth
                      <span class="p1 fa-stack fa-2x has-badge" data-count="{{$data ? $data:''}}">
                        <i class="p3 fas fa-shopping-cart mb-1 fa-stack-1x xfa-inverse"></i>
                      </span>
                    @endauth

                      @guest
                        <span class="p1 fa-stack fa-2x has-badge">
                          <i class="p3 fas fa-shopping-cart mb-1 fa-stack-1x xfa-inverse"></i>
                        </span> 
                      @endguest

                     </a>
                     </span>
                    </div>
                    @guest
                    <a class="nav-link nav-user-img text-white mt-4" href="{{route('login')}}"> LOGIN</a>
                    @endguest

                    @auth
                    <div class="dropdown bg-transparent mt-4">
                      
                     <li class="nav-item dropdown no-arrow">
      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="mr-2 d-none d-lg-inline text-white">{{auth()->user()->name}}</span>
        @if (auth()->user()->logo)
        <img class="img-profile rounded-circle" src="{{ url('storage/'.Auth::user()->logo) }}" style="width: 50px;height: 50px">
        @else
        <img class="img-profile rounded-circle" src="{{asset('images/default.png')}}" style="width: 50px;height: 50px">
        @endif

      </a>
                        

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                          <a class="dropdown-item" href="{{route('user.index')}}">Dashboard</a>
                          <a class="dropdown-item" href="{{route('account.logout')}}">Logout</a>
                        </div>
                      </div>
                      @endauth


                   {{--
                    @auth
                    <a class="nav-link nav-user-img text-white" href="{{route('user.index')}}"> Account</a>
                    @endauth
                    --}}
                  </div>
              </div>
          </div>
      </div>
  </section>

  <nav class="navbar navbar-expand-md navbar-main border-bottom">
      <div class="container">
          <form action="{{route('shop.catalog')}}" class="d-md-none my-2">
              <div class="input-group"> 
                  <input type="search" name="filter[title]" class="form-control" placeholder="Search" required="">
                  <div class="input-group-append"> 
                    <button type="submit" class="btn btn-secondary"> <i class="fa fa-search"></i> </button> 
                  </div>
              </div>
          </form> 
          <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#dropdown6" aria-expanded="false"> <span class="navbar-toggler-icon"></span> </button>
          <div class="navbar-collapse collapse" id="dropdown6" >
              <ul class="navbar-nav mr-auto">
            <ul class="nav">
                  <li><a class="nav-link" href="{{route('shop.index')}}"aria-expanded="false">Home</a></li>

                  <li><a href="#">Product</a>
                      <ul>
                        @foreach($flashSaleProducts as $item)
                        <li><a class="nav-link" href="{{$item->path()}}"aria-expanded="false">{{substr($item->product->title,0,12)}}</a></li>
                        @endforeach
                          <li><a href="#">All Products</a>
                            <ul>
                              @foreach($newProducts as $product)
                              <li><a class="dropdown-item" href="{{'/catalog?filter[subCategory]='.$item->subCategory_name}}" style="font-size:.8rem" class="text-sm" data-abc="true">{{substr($product->title,0,12)}}</a></li>
                              @endforeach
                            </ul>
                          </li>
                        </ul>
                    </li>

                <li><a href="#">All Categories</a>
                      <ul>
                        @foreach($navbarCategories as $category)
                          <li><a href="#">{{$category->category_name}}</a>
                            <ul>
                              @foreach($category->subCategory as $item)
                              <li><a class="dropdown-item" href="{{'/catalog?filter[subCategory]='.$item->subCategory_name}}" style="font-size:.8rem" class="text-sm" data-abc="true">{{$item->subCategory_name}}</a></li>
                              @endforeach
                            </ul>
                          </li>
                          @endforeach
                        </ul>
                    </li>
                    
            </ul>
{{--
                @foreach($navbarCategories as $category)
                  <li class="nav-item dropdown small"> <a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" data-abc="true" aria-expanded="false">{{$category->category_name}}</a>
                      <ul class="dropdown-menu"> 
                      @foreach($category->subCategory as $item)
                        <a class="dropdown-item" href="{{'/catalog?filter[subCategory]='.$item->subCategory_name}}" style="font-size:.8rem" class="text-sm" data-abc="true">{{$item->subCategory_name}}</a> 
                      @endforeach 
                      </ul>
                  </li>
                  @endforeach
--}}
              </ul>
          </div>
      </div>

  </nav>
</header>
