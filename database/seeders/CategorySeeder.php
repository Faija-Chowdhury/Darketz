<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = [
            [
                'name' => 'Electronics',
                'subCategory' => ['Mobile', 'Laptops', 'Desktops']
            ],
            [
                'name' => 'Electronic Accessories',
                'subCategory' => ['Phone Cases', 'Chargers', 'Screen protectors']
            ],
            [
                'name' => 'Personal Care',
                'subCategory' => ['Mens grooming', 'Deodrants']
            ],
            [
                'name' => 'Babys & Toys',
                'subCategory' => ['Toys & Games']
            ],
            [
                'name' => 'Grocery & Pets',
                'subCategory' => ['Beverages', 'Breakfast', 'Fruits', 'Pet Food']
            ],
            [
                'name' => 'Home & Lifestyle',
                'subCategory' => ['Bath', 'Decor', 'Furniture', 'Appliances & Electicals',  'Kitchen Utensils']
            ],
            [
                'name' => 'Sports & Outdoors',
                'subCategory' => ['Mens Collections', 'Exercise & Fitness', 'Travel & Luggage']
            ],
            [
                'name' => 'AutoMotive & Motorbike',
                'subCategory' => ['Riding gear']
            ],
        ];

        foreach ($categories as $category) {

            $newCategory = Category::create([
                'category_name' => $category['name'],
            ]);
            foreach ($category['subCategory'] as $item) {
                $subcategory = SubCategory::create([
                    'category_id' => $newCategory->id,
                    'subCategory_name' => $item,
                ]);
            }
        }
    }
}
