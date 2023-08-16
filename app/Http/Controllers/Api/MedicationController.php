<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Medication;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MedicationController extends Controller
{
    /**
     * Display a listing of the medication.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // $myMedication = Medication::query()->with('course');
        $myMedication = Medication::query()->with('user');

        $medicationId = $request->query('medication_id');
        $userId = Auth::user()->id; 

        // filter query
        $myMedication->when($medicationId, function ($query) use ($medicationId) {
            return $query->where('id', '=', $medicationId);
        });

        // filter status
        $myMedication->when($userId, function ($query) use ($userId) {
            return $query->where('user_id', '=', $userId);
        });

        return response()->json([
            'status' => 'success',
            'data' => $myMedication->get()
        ]);
    }
}
