<?php
// Obtén el ID del rol que se va a modificar (puedes pasarlo por GET o POST)
$id_rol = $_GET['id_rol'];

// Conexión a la base de datos (incluye tu archivo de conexión)
include('conexion/conexion.php');

// Obtén el nombre del rol
$consultaRol = mysqli_query($conexion, "SELECT NOMBRE_ROL FROM tbl_ms_roles WHERE ID_ROL = $id_rol");
$rol = mysqli_fetch_assoc($consultaRol);

// Obtén los permisos actuales del rol
$consultaPermisosRol = mysqli_query($conexion, "SELECT id_permiso FROM tbl_roles_permisos WHERE id_rol = $id_rol");
$permisosRol = array();
while ($permisoRol = mysqli_fetch_assoc($consultaPermisosRol)) {
    $permisosRol[] = $permisoRol['id_permiso'];
}

// Obtén la lista completa de permisos
$consultaPermisos = mysqli_query($conexion, "SELECT ID_PERMISO, NOMBRE_PERMISO FROM tbl_permisos");

// Procesa el formulario de modificación de permisos
if (isset($_POST['modificar_permisos'])) {
    // Elimina todos los permisos anteriores para este rol
    mysqli_query($conexion, "DELETE FROM tbl_roles_permisos WHERE id_rol = $id_rol");

    // Asigna los nuevos permisos seleccionados
    foreach ($_POST['permisos'] as $permisoID) {
        mysqli_query($conexion, "INSERT INTO tbl_roles_permisos (id_rol, id_permiso) VALUES ($id_rol, $permisoID)");
    }

    // Redirige de nuevo a la página de roles o a donde necesites
    header("Location: roles.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <!-- Tu encabezado HTML aquí -->
</head>
<body>
    <h1>Modificar Permisos para <?php echo $rol['NOMBRE_ROL']; ?></h1>
    <form method="post" action="modificar_permisos.php?id_rol=<?php echo $id_rol; ?>">
        <table>
            <thead>
                <tr>
                    <th>Permiso</th>
                    <th>Asignar</th>
                </tr>
            </thead>
            <tbody>
                <?php
                while ($permiso = mysqli_fetch_assoc($consultaPermisos)) {
                    $checked = in_array($permiso['ID_PERMISO'], $permisosRol) ? "checked" : "";
                    echo "<tr>";
                    echo "<td>" . $permiso['NOMBRE_PERMISO'] . "</td>";
                    echo "<td><input type='checkbox' name='permisos[]' value='" . $permiso['ID_PERMISO'] . "' $checked></td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
        <button type="submit" name="modificar_permisos">Guardar Cambios</button>
    </form>
</body>
</html>

