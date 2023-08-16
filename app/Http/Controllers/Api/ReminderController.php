<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Reminder;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class ReminderController extends Controller
{
    public function index(Request $request)
    {
        // $reminder = Reminder::query();

        // // membuat fitur search
        // $q = $request->query('query');

        // // filter query
        // $reminder->when($q, function ($query) use ($q) {
        //     return $query->whereRaw("name LIKE '%" . strtolower($q) . "%'");
        // })->with('category')->with('inventory');

        // return response()->json([
        //     'status' => 'success',
        //     'data' => $reminder
        // ]);

        // Carbon::resetToStringFormat();
        $currentDateTime = Carbon::now();
        // return gettype($currentDateTime);

        // $startDate = '2023-08-15 12:00:33';
        $startDate = $currentDateTime->subMinutes(5)->toDateTimeString();
        // $startDate = $currentDateTime->subMinutes(5)->toDateTimeString();
        // return gettype($startDate) . ' ' . $startDate ;

        // $endDate = '2023-08-15 12:05:33';
        $endDate = $currentDateTime->addMinutes(10)->toDateTimeString();
        // $endDate = $currentDateTime->addMinutes(5)->toDateTimeString();
        // return gettype($endDate) . ' ' . $endDate;

        // $userId = $request->query('userId');
        $userId = Auth::user()->id;

        $reminders = Reminder::with('medication.drugShelf')->with('user')
            ->where('user_id', $userId)
            ->whereBetween('reminder_datetime', [$startDate, $endDate])
            ->get();


        // $reminderId = $request->query('reminderId');

        return response()->json([
            'status' => 'success',
            'data' => $reminders
        ]);
    }
}
