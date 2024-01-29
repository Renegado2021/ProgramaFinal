<?php
include('conexion/conexion.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $idRol = $_POST['id_rol'];
    $idPermiso = $_POST['id_permiso'];
    $idObjeto = $_POST['id_objeto'];

    // Verificar si ya existe un registro para este rol y objeto, si es así, actualízalo.
    $sql = "INSERT INTO tbl_roles_permisos (id_rol, id_permiso, id_objeto) VALUES (?, ?, ?)
            ON DUPLICATE KEY UPDATE id_permiso = VALUES(id_permiso)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$idRol, $idPermiso, $idObjeto]);

    // Después de procesar el formulario con éxito, redirige al usuario a admin.php
header("Location: admin.php");
exit; // Asegúrate de salir del script para evitar ejecución adicional

}
?>
