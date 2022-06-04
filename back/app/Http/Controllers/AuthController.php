<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\agence;
use App\Models\client;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class AuthController extends Controller

//user
{
    //Register user
  public function register(Request $request)
  {
      //validate fields
      $attrs = $request->validate([
          'name' => 'required|string',
          'email' => 'required|email|unique:agences,email',
          'password' => 'required|min:6'
      ]);

      //create user
      $user = agence::create([
          'name' => $attrs['name'],
          'email' => $attrs['email'],
          'password' => Hash::make($request->password)
      ]);

      //return user & token in response
      return response([
          'user' => $user,
          'token' => $user->createToken('secret')->plainTextToken
      ], 200);
  }

  // login user
  
    public function login(Request $request)
    {   
        $fields = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string'
        ]);
    
        // Check email
        $agence = agence::where('email', $fields['email'])->first();
    
        // Check password
        if($agence && Hash::check($request->password, $agence->password)) {
            $token = $agence->createToken('myapptoken')->plainTextToken;
            $response = ['agence' => $agence, 'token' => $token];
            return response()->json($response, 200);
        }
        $response = ['message' => 'Incorrect email or password'];
        return response()->json($response, 400);
        
    }
    public function register_client(Request $request)
  {
      //validate fields
      $attrs = $request->validate([
          'name' => 'required|string',
          'email' => 'required|email|unique:clients,email',
          'password' => 'required|min:6'
      ]);

      //create user
      $user = Client::create([
          'name' => $attrs['name'],
          'email' => $attrs['email'],
          'password' => Hash::make($request->password)
      ]);

      //return user & token in response
      return response([
          'user' => $user,
          'token' => $user->createToken('secret')->plainTextToken
      ], 200);
  }
  public function login_client(Request $request)
  {   
      $fields = $request->validate([
          'email' => 'required|string',
          'password' => 'required|string'
      ]);
  
      // Check email
      $agence = Client::where('email', $fields['email'])->first();
  
      // Check password
      if($agence && Hash::check($request->password, $agence->password)) {
          $token = $agence->createToken('myapptoken')->plainTextToken;
          $response = ['agence' => $agence, 'token' => $token];
          return response()->json($response, 200);
      }
      $response = ['message' => 'Incorrect email or password'];
      return response()->json($response, 400);
      
  }

  

 
  

}

  























//code 
    // get user details
    /*
    public function user()
    {
        return response([
            'user' => auth()->user()
        ], 200);
    }*/
     
    // update user
    /*public function update(Request $request)
    {
        $attrs = $request->validate([
            'name' => 'required|string'
        ]);

        $image = $this->saveImage($request->image, 'profiles');
        
        auth()->user()->update([
            'name' => $attrs['name'],
            'image' => $image
        ]);

        return response([
            'message' => 'User updated.',
            'user' => auth()->user()
        ], 200);
    }*/


