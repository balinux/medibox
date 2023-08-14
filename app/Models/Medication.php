<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medication extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id', 'medication_name', 'dosage', 'start_date', 'end_date', 'frequency', 'notes',
    ];

    // Relasi dengan pengguna dan pengingat
    public function user()
    {
        return $this->belongsTo(User::class, 'id', 'id');
    }
}
