<?php

use App\Http\Controllers\API\MedicationController;
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

// register and login
Route::post('/register', [\App\Http\Controllers\Api\AuthController::class, 'register']);
Route::post('/login', [\App\Http\Controllers\Api\AuthController::class, 'login']);

Route::get('reminder', [ReminderController::class, 'index']);

Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('/logout', [\App\Http\Controllers\Api\AuthController::class, 'logout']);
    Route::get('reminder', [ReminderController::class, 'index']);
    Route::get('reminder-base-timeframe', [ReminderController::class, 'timeFrame']);
    Route::get('medication', [MedicationController::class, 'index']);
    Route::put('reminder/{id}/complete', [ReminderController::class,'complete']);
});
