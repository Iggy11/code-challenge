@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    You are logged in!
                </div>
            </div>


            @if(! $customerLoginActivity->isEmpty())

            <h3>Login Activity Statistics</h3>
            <div class="table-responsive">

                <table class="table table-striped table-sm">
                    <thead>
                        <th>#</th>
                        <th>Email Address</th>
                        <th>IP Address</th>
                        <th>LogIn date attempt</th>
                        <th>LogIn result</th>
                    </thead>

                    <tbody>
                        @foreach($customerLoginActivity as $customerLogin)
                            <tr>
                                <td></td>
                                <td> {{ $customerLogin->email_address }}</td>
                                <td>{{ $customerLogin->ip_address }}</td>
                                <td>{{ \Carbon\Carbon::parse($customerLogin->created_at)->format('l jS \\of F Y h:i:s A') }}</td>
                                <td>{{ $customerLogin->is_success ? 'Success' : 'Failed'}}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

            </div>
            @endif


        </div>
    </div>
</div>
@endsection
