<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $factoryUsers = [
            [
                'name' => 'Admin Default',
                'email' => 'admin@mail.com',
                'password' => Hash::make('admin123'),
                'role' => 'admin'
            ],
            [
                'name' => 'User Default',
                'email' => 'user@mail.com',
                'password' => Hash::make('user123'),
                'role' => 'user'
            ],
            [
                'name' => 'Shipper Default',
                'email' => 'shipper@mail.com',
                'password' => Hash::make('shipper123'),
                'role' => 'shipper'
            ],
        ];

        foreach ($factoryUsers as $user) {
            $newUser =  User::create([
                'name' => $user['name'],
                'email' => $user['email'],
                'password' => $user['password'],
            ]);
            $newUser->assignRole($user['role']);
        }
    }
}
