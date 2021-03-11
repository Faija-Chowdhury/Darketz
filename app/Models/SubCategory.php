<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;

    protected $guarder = [];
    protected $fillable = [
        'category_id', 'SubCategory_name', 'logo',
    ];

    public function category()
    {
        return $this->belongsTo('App\Models\Category');
    }
}
