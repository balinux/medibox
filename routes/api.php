<?php

use App\Http\Controllers\Api\ReminderController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('reminder', [ReminderController::class, 'index']);

Route::middleware(['auth:sanctum'])->group(function () {
    // Route::get('/', function () {
    //     // Uses first & second middleware...
    // });

    // Route::get('/user/profile', function () {
    //     // Uses first & second middleware...
    // });

    Route::get('reminder', [ReminderController::class, 'index']);
});
