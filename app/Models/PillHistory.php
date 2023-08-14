<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PillHistory extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id', 'medication_id', 'dosage_taken', 'timestamp',
    ];

    // Relasi dengan pengguna dan obat
    public function user()
    {
        return $this->belongsTo(User::class, 'id', 'id');
    }

    public function medication()
    {
        return $this->belongsTo(Medication::class, 'id', 'id');
    }
}
