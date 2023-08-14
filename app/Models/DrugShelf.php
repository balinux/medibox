<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DrugShelf extends Model
{
    use HasFactory;


    protected $primaryKey = 'id';

    protected $fillable = [
        'shelf_name', 'description',
    ];

    // Relasi dengan obat-obatan
    public function medications()
    {
        return $this->hasMany(Medication::class, 'shelf_id', 'id');
    }
}
