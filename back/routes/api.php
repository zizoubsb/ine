<?php

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\OfferController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\AgenceController;
use App\Http\Controllers\FavoriteController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register_client', [AuthController::class, 'register_client']);
Route::post('/login_client', [AuthController::class, 'login_client']);

// Public routes
Route::post('/register_agence', [AuthController::class, 'register_agence']);
Route::post('/login_agence', [AuthController::class, 'login_agence']);
// Public routes client
Route::post('/register_client', [AuthController::class, 'register_client']);
Route::post('/login_client', [AuthController::class, 'login_client']);

Route::post('/logout', [AuthController::class, 'logout']);
//offer
Route::group(['middleware' => ['auth:sanctum']], function () {
    //offer
    Route::post('/offer/create', [OfferController::class, 'create']);
    Route::post('/offer/delete', [OfferController::class, 'delete']);
    Route::post('/offer/update', [OfferController::class, 'update']);
    Route::get('/offer', [OfferController::class, 'offers']);
    Route::get('/offer/offer', [OfferController::class, 'myoffer']);
    
     //favorite
     Route::post('/fav/{id}', [OfferController::class, 'favoriteoffer']);
     Route::get('/myfav', [OfferController::class, 'myFavorites']);
     Route::post('/unfavorite/{id}', [OfferController::class, 'unFavoriteoffer']);
   //profile agence----client
    Route::post('/saveagenceInfo', [AuthController::class, 'saveagenceInfo']);
    Route::post('/saveclientInfo', [AgenceController::class, 'saveclientInfo']);
   // Route::get('/offer', [PostController::class, 'offer']);
});

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
