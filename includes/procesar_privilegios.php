<?php
include('conexion/conexion.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $idObjeto = $_POST['id_objeto'];
    
    // Recopila los privilegios de las acciones desde el formulario (pueden ser campos de entrada o casillas de verificación).
    $privilegios = $_POST['privilegios'];

    // Actualiza la tabla tbl_objetos con los nuevos privilegios.
    $sql = "UPDATE tbl_objetos SET privilegios = ? WHERE id_objeto = ?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([json_encode($privilegios), $idObjeto]);

    // Después de procesar el formulario con éxito, redirige al usuario a admin.php
header("Location: admin.php");
exit; // Asegúrate de salir del script para evitar ejecución adicional

}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Asignación de Privilegios</title>
</head>
<body>
    <form action="procesar_privilegios.php" method="post">
        <label for="id_objeto">Objeto/Vista:</label>
        <select name="id_objeto">
            <!-- Aquí generas dinámicamente las opciones de objetos/vistas desde la base de datos -->
        </select>
        <label>Privilegios:</label>
        <!-- Aquí debes crear campos de entrada o casillas de verificación para los privilegios de las acciones -->
        <input type="checkbox" name="privilegios[]" value="accion1"> Acción 1
        <input type="checkbox" name="privilegios[]" value="accion2"> Acción 2
        <!-- Agrega más campos según las acciones disponibles -->
        <input type="submit" value="Asignar Privilegios">
    </form>
</body>
</html>
