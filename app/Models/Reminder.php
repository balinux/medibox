<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reminder extends Model
{
    use HasFactory;
    
    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id', 'medication_id', 'reminder_datetime', 'is_completed',
    ];

    // Relasi dengan pengguna dan obat
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function medication()
    {
        return $this->belongsTo(Medication::class, 'medication_id', 'id');
    }

    public function pillHistory()
    {
        return $this->hasMany(PillHistory::class, 'medication_id', 'id');
    }
}
