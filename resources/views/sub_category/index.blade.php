@extends('layouts.admin')

@section('content')
        <!-- Topbar -->
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Manage Sub Category</h1>
          </div>

          <div class="row">
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                </div>

                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">

                    <thead class="thead-light">
                      <tr>
                        <th>No</th>
                        <th>Sub Category Name</th>
                        <th>Logo</th>
                        <th>Created On</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      @php ($i=1)
              @foreach ($sub_categories as $sub_catalog)
                      <tr>
                        <td>{{$i++}}</td>
                        <td>{{$sub_catalog->subCategory_name}}</td>
                        
                        <td>
                          @if($sub_catalog->logo)
                            <img src="{{asset('/storage/'.$sub_catalog->logo)}}" style="height: 80px; width:100px">
                          @endif
                        </td>

                        <td>{{$sub_catalog->created_at}} </td>
                        <td>
                          <button onclick="setUpdate({{ $sub_catalog->id }},'{{ $sub_catalog->subCategory_name }}')"  data-target="#updateCategory" id="#updateCategoryAmount" type="button" class="btn btn-warning" data-toggle="modal"
                      >
                          <i class="fas fa-user-edit">Update Logo</i></button>

                          <!--Update Category Modal Center -->
  <div class="modal fade" id="updateCategory" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

          <div class="modal-header">
              <h5 class="modal-title" id="updateCategoryAmount">Update Category</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
            </div>
            <input type="hidden" value="{{$sub_catalog->id}}" id="id">
              <form action="" method="POST" id="update_form" enctype="multipart/form-data">
              @csrf
              @method('PUT')
              <div class="modal-body form-group">
                <label for="logo">Sub Category Name</label>
                    <input name="subCategory_name" id="subCategory_name" class="form-control  mb-3" type="text">
                    <label for="logo">Upload Photos</label>
                    <input name="logo" id="" class="form-control  mb-3" type="file">
                </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save</button>
                    </div>
                </form>
          </div>
        </div>
      </div>

                  </td>
                      </tr>
                    @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!--Row-->
        </div>
        <!---Container Fluid-->
          <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
@endsection


@push('js')
  <script>
        function setUpdate(id,subCategory_name,logo){
            $('#subCategory_name').val(subCategory_name);
            $('#logo').val(logo);
            $('#update_form').attr('action', '{{ url('/') }}/sub_category/'+id);
        }
    </script>
@endpush
