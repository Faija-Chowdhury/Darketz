@extends('layouts.app')

@section('page-title','My Cart')

@section('content')
<div class="container-fluid py-3" style="min-height: 80vh">
  <div class="row no-gutters">

    <div class="col-xl-2 col-md-2 col-sm-12 ml-auto">
      @include('inc.app.user-sidebar')
    </div>

    <div class="col-xl-8 col-md-8 col-sm-12 mr-auto">
      {{-- my cart component --}}
      <my-cart></my-cart>


    </div>
  </div>
</div>
@endsection

@push('js')
<script type="text/javascript">
$('#option-cod').click(function(){
  $('#form-cod').slideDown(500);
  $('#form-card').slideUp(300);
  $('#form-bkash').slideUp(300);
  $('#payment-form').slideUp(300);
});

$('#option-card').click(function(){
  $('#form-card').slideDown(500);
  $('#form-bkash').slideUp(300);
  $('#form-cod').slideUp(300);
  $('#payment-form').slideUp(300);
  $('#option-cod').removeClass('selected');
});


$('#option-bkash').click(function(){
  $('#form-bkash').slideDown(500);
  $('#form-card').slideUp(300);
  $('#form-cod').slideUp(300);
  $('#payment-form').slideUp(300);

  $('#option-cod').removeClass('selected');
});

</script>
@endpush
