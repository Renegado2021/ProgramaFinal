<?php
// Obtener el ID del proveedor enviado por POST
$proveedorId = isset($_POST['proveedorId']) ? $_POST['proveedorId'] : null;

// Validar el ID del proveedor
if ($proveedorId === null || !is_numeric($proveedorId)) {
    echo json_encode(['error' => 'ID de proveedor no válido']);
    exit;
}



// Conectar a la base de datos (ajusta según tus credenciales)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gestion_compras2";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    echo json_encode(['error' => 'Error de conexión a la base de datos']);
    exit;
}

// Consultar la información del proveedor en tbl_cotizacion
$sqlProveedor = "SELECT ID_COTIZACION FROM tbl_cotizacion WHERE ID_PROVEEDOR = $proveedorId AND ESTADO = 'Aprobada'";

$resultProveedor = $conn->query($sqlProveedor);

// Verificar si se obtuvieron resultados
if ($resultProveedor === false) {
    echo json_encode(['error' => 'Error al buscar proveedor en tbl_cotizacion']);
    exit;
}

// Verificar si se encontró el proveedor
if ($resultProveedor->num_rows === 0) {
    echo json_encode(['error' => 'Proveedor no encontrado']);
    exit;
}

// Obtener el ID de la cotización del proveedor
$rowProveedor = $resultProveedor->fetch_assoc();
$cotizacionId = $rowProveedor['ID_COTIZACION'];

// Consultar los ítems de la cotización en tbl_cotizacion_detalle
$sqlCotizacionDetalle = "SELECT CANTIDAD, DESCRIPCION 
                          FROM tbl_cotizacion_detalle
                          WHERE ID_COTIZACION = $cotizacionId";

$resultCotizacionDetalle = $conn->query($sqlCotizacionDetalle);

// Verificar si se obtuvieron resultados
if ($resultCotizacionDetalle === false) {
    echo json_encode(['error' => 'Error al buscar ítems de cotización en tbl_cotizacion_detalle']);
    exit;
}

// Obtener los datos de las cotizaciones en un array
$cotizacionData = [];

while ($row = $resultCotizacionDetalle->fetch_assoc()) {
    $cotizacion = [
        'CANTIDAD' => $row['CANTIDAD'],
        'DESCRIPCION' => $row['DESCRIPCION'],
    ];

    $cotizacionData[] = $cotizacion;
}

// Liberar los resultados y cerrar la conexión
$resultProveedor->free_result();
$resultCotizacionDetalle->free_result();
$conn->close();

// Devolver los datos en formato JSON
echo json_encode($cotizacionData);
?>

