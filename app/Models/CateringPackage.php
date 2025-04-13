<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\SoftDeletes;

class CateringPackage extends Model
{
    use HasFactory, SoftDeletes;

    

    protected $fillable = [
        'name',
        'slug',
        'thumbnail',
        'about',
        'is_popular',
        'category_id',
        'city_id',
        'kitchen_id',
    ];
    
    public function setNameAttributes($value) {
        $this->attributes['name'] = $value;
        $this->attributes['slug'] = Str::slug($value);
    }

    public function category()
{
    return $this->belongsTo(Category::class);
}

public function city()
{
    return $this->belongsTo(City::class);
}



public function kitchen(): BelongsTo
{
    return $this->belongsTo(Kitchen::class);
}


    public function bonuses(): HasMany
    {
        return $this->hasMany(CateringBonus::class);
    }

    public function photos(): HasMany
    {
        return $this->hasMany(CateringPhoto::class);
    }

    public function testimonials(): HasMany
{
    return $this->hasMany(CateringTestimonial::class); 
}

    public function tiers(): HasMany
    {
        return $this->hasMany(CateringTier::class);
    }

    protected static function booted()
    {
        static::saving(function ($cateringpackage) {
            if (empty($cateringpackage->slug)) {
                $cateringpackage->slug = Str::slug($cateringpackage->name);
            }
        });
    }
}
