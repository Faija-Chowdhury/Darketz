@extends('layouts.app')

@section('page-title','User Account')

@section('content')
<div class="container-fluid py-3" style="min-height: 80vh">
  <div class="row no-gutters">

    <div class="col-xl-2 col-md-2 col-sm-12 ml-auto">
      @include('inc.app.user-sidebar')
    </div>

    <div class="col-xl-8 col-md-8 col-sm-12 mr-auto">
      <div class="card shadow">
        <div class="card-header bg-light border-bottom">
          <p class="mb-0 ">Update Profile</p>
        </div>

        <div class="card-body">
          <div class="pl-lg-4">
            <form action="{{route('update.profile')}}" method="post" enctype="multipart/form-data">
        	@csrf
        	<input type="hidden" name="id"  class="form-control form-control-alternative" disabled
                      placeholder="id" value="{{ Auth::user()->id }}" >
            <h6 class="heading-small text-muted mb-4">User information</h6>
            <div class="pl-lg-12">
              <div class="row">

              	<div class="col-lg-6">
                  <div class="form-group focused">
                    @if (auth()->user()->logo)
        <img class="img-profile rounded-circle" src="{{ url('storage/'.Auth::user()->logo) }}" style="width: 80px;height: 80px">
        @else
        <img class="img-profile rounded-circle" src="{{asset('images/default.png')}}" style="width: 80px;height: 80px">
        @endif<br>
                    <div class="form-group">
                    <label for="exampleInputPhoto1">Photo</label>
                    <div class="custom-file">
                    <input type="file" name="logo" class="custom-file-input" value="{{ url('storage/'.Auth::user()->logo) }}" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                  </div>
                </div>

                <div class="col-lg-6">
                  <div class="form-group focused">
                    <label></label>
                    <input type="hidden"  class="form-control form-control-alternative" disabled
                      placeholder="id" value="{{ Auth::user()->status }}" >
                  </div>
                </div>

                <div class="col-lg-6">
                  <div class="form-group focused">
                    <label >Username</label>
                    <input type="text" name="name" class="form-control form-control-alternative"
                      placeholder="Username" value="{{ Auth::user()->name }}">
                  </div>
                </div>

                <div class="col-lg-6">
                  <div class="form-group focused">
                    <label >Email</label>
                    <input type="text" name="email" class="form-control form-control-alternative" disabled
                      placeholder="Email" 
                      value="{{ Auth::user()->email}}">
                  </div>
                </div>
                <button class="btn btn-primary" type="submit">Update Profile</button>
            </form>
          </div>
      </div>
  </form>
</div>
</div>
</div>
</div>
</div>
</div>
@endsection