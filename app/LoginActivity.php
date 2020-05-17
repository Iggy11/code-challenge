<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class LoginActivity extends Model
{
    protected $table = 'login_activity';

    protected $fillable = [
        'customer_id', 'email_address', 'ip_address', 'is_success',
    ];

    //public function getStatsBy
}
