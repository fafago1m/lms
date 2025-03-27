<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\CityApiResource;
use App\Models\City;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public function index()
    {
        // Using eager loading for the correct relationship 'cateringPackages'
        $cities = City::with(['cateringPackages'])->get();
        return CityApiResource::collection($cities);
    }

    public function show(City $city)
    {
        // Using the correct relationship name without spaces 'cateringPackages'
        $city->load(['cateringPackages', 'cateringPackages.category', 'cateringPackages.tiers']);
        $city->loadCount('cateringPackages');
        return new CityApiResource($city);
    }
}

