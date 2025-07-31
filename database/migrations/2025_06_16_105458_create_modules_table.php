<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('modules', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();                   // মডিউলের নাম
            $table->string('slug')->unique();                   // URL-friendly slug
            $table->enum('type', ['module', 'permission']);     // মডিউল টাইপ
            $table->unsignedBigInteger('parent_id')->nullable();// parent module (for sub-permissions)
            $table->integer('order')->default(0);               // মেনু অর্ডার
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('modules');
    }
};
