<?php

use App\Modules\Classroom\Controllers\ClassroomController;
use Illuminate\Support\Facades\Route;

Route::controller(ClassroomController::class)->group(function () {
  Route::get('classroom', 'index');
});
