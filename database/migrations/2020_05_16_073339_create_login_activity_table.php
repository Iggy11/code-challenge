<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLoginActivityTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('login_activity', function (Blueprint $table) {
            $table->id();
           // $table->unsignedInteger('customer_id')->nullable();
            $table->bigInteger('customer_id')->unsigned()->nullable();
            $table->string('email_address');
            $table->ipAddress('ip_address');
            $table->timestamps();


        });

        Schema::table('login_activity', function(Blueprint $table) {
            $table->foreign('customer_id')->references('id')->on('customers');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('login_activity');
    }
}
