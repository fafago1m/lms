<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\CateringPackageApiResource;
use App\Models\CateringPackage;
use Illuminate\Http\Request;

class CateringPackageController extends Controller
{
    public function index()
    {

        $cateringPackages = CateringPackage::with(['city', 'kitchen', 'category', 'tiers', 'tiers.benefits'])->get();
        return CateringPackageApiResource::collection($cateringPackages);
    }

    public function show(CateringPackage $cateringPackage)
    {

        $cateringPackage->load([
            'city', 
            'photos', 
            'bonuses', 
            'category', 
            'kitchen', 
            'testimonials', 
            'tiers', 
            'tiers.benefits'
        ]);

        // This method should be `cateringPackages` (plural), not singular
        $cateringPackage->kitchen->loadCount('cateringPackages');  // Correct the method name here

        return new CateringPackageApiResource($cateringPackage);
    }
}

