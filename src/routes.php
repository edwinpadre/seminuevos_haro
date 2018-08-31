<?php

use Slim\Http\Request;
use Slim\Http\Response;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;

$app->get('/', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});

$app->get('/nosotros', function (Request $request, Response $response, array $args) {
    $this->logger->info("Slim-Skeleton '/nosotros' route");
    return $this->renderer->render($response, '/nosotros.html', $args);
});

$app->get('/contacto', function (Request $request, Response $response, array $args) {
    $this->logger->info("Slim-Skeleton '/nosotros' route");
    return $this->renderer->render($response, '/contacto.html', $args);
});

$app->get('/ubicacion', function (Request $request, Response $response, array $args) {
    $this->logger->info("Slim-Skeleton '/nosotros' route");
    return $this->renderer->render($response, '/ubicacion.html', $args);
});

$app->get('/galeria', function (Request $request, Response $response, array $args) {
    $this->logger->info("Slim-Skeleton '/nosotros' route");
    return $this->renderer->render($response, '/galeria.php', $args);
});

$app->get('/upload', function (Request $request, Response $response, array $args) {
    $this->logger->info("Slim-Skeleton '/nosotros' route");
    return $this->renderer->render($response, '/Upload.html', $args);
});

$app->get('/vista', function (Request $request, Response $response, array $args) {
    $this->logger->info("Slim-Skeleton '/nosotros' route");
    return $this->renderer->render($response, '/Vista.html', $args);
});

$app->get('/search', function (Request $request, Response $response, array $args) {
    $this->logger->info("Slim-Skeleton '/nosotros' route");
    return $this->renderer->render($response, '/api/search', $args);
});

/***********************************************************************
 *                       API CALLS                                     *
 ***********************************************************************/

$app->post('/api/upload', function (ServerRequestInterface $request, ResponseInterface $response, $args) {
    $params = $request->getParams();
    $res = new \src\app\Controllers\PostData();
    $res -> createNewCar($params);
    if($res){
        return $this->response->withRedirect('/');
    } else {
        return $this->response->withRedirect('/upload');
    }
});

$app->get('/api/getAll', function (ServerRequestInterface $request, ResponseInterface $response, $args) {
    $params = $request->getParams();
    $res = new \src\app\Controllers\GetData();
    $res -> getAll($params);
});

$app->get('/api/search', function (ServerRequestInterface $request, ResponseInterface $response, $args) {
    $params = $request->getParams();
    $res = new \src\app\Controllers\PostData();
    $res -> searchQuery($params);
});

$app->get('/api/search_by_tag', function (ServerRequestInterface $request, ResponseInterface $response, $args) {
    $params = $request->getParams();
    $res = new \src\app\Controllers\PostData();
    $res -> searchByTag($params);
});

?>
