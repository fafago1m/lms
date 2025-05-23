<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class CateringTestimonial extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'name',
        'message',
        'photo',
        'catering_package_id'

    ];

    public function CateringPackage (): BelongsTo {
           return $this->belongsTo(CateringPackage::class);
    }
}
