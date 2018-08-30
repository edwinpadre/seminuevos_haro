<?php
// Application middleware
include ('app/Controllers/Postdata.php');
include ('app/Controllers/GetData.php');
include('app/Model/MainModel.php');
$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
        ->withHeader('Access-Control-Allow-Origin', '*')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});

$app->add(function($request, $response, $next) {
    $response = $next($request, $response);
    return $response;
});