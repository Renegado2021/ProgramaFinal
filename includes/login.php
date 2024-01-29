

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	

</head>

<body>
<div class="row">
            <div class="col-5" style=" border-radius: 0 50% 50% 0; height: 100vh; background-color: #04346D;padding-top: 16%; padding-left: 10%;
       ">
                <img src="ihci.png" alt="" style=" max-width: 400PX;
            max-height: 50%;
            
            ">

           
            </div>
            <div class="col-7" style="padding-top: 5%;">
               <div>
                    <h1 style="width: 100%; text-align: center;">Gestión de Compras IHCI</h1>
                </div>
                <div class="row" style="padding-top: 5%; margin-top: 5%;  font-family: 'poppins' !important;">
                    <div class="col-8" style="text-align: center;">
                        <h3>¿Quieres crear una cuenta?</h3>
                    </div>
                    <div class="col-4" onclick="registrarse()">
                        <a style=" text-decoration: underline; color: cornflowerblue;">
                            <h3>Regístrese</h3>
                        </a>
                    </div>
                </div>

                <div style="width: 100%; padding-left: 10%; padding-top: 10%; padding-bottom: 2%;">
                    Usuario
                </div>
                <div class="input-group mb-3" style="width: 80%; padding-left: 10%;">
                    <span class="input-group-text" id="basic-addon1" style="background-color: #E6E6E6;"><img
                            style="width: 30px; " src="img/usuario.png" alt=""></span>
                    <input type="text" class="form-control" placeholder="Usuario" aria-label="Usuario"
                        aria-describedby="basic-addon1">
                </div>

                <div style="width: 100%; padding-left: 10%; padding-top: 2%; padding-bottom: 2%;">
                    Contraseña
                </div>
                <div class="input-group mb-3" style="width: 80%; padding-left: 10%;">
                    <span class="input-group-text" id="basic-addon1" style="background-color: #E6E6E6;"><img
                            style="width: 30px; " src="img/recargar.png" alt=""></span>
                    <input id="contraseñaLogin" type="password" class="form-control" placeholder="Contraseña"
                        aria-label="Usuario" aria-describedby="basic-addon1">
                </div>
                <div class="form-check" style="width: 80%; padding-left: 10%; margin-top: 5%;">
                    <input class="form-check-input" onchange="verContra()" type="checkbox" id="contraVer">
                    <label class="form-check-label" for="flexCheckDefault">
                        Mostrar la contraseña
                    </label>
                </div>

                <button style="background-color: #555CB3; width: 50%; margin-left: 25%; margin-top: 5%;" type="button"
                    class="btn btn-primary">iniciar sesión</button>

                <div style="width: 80%; padding-left: 10%; margin-top: 5%;">
                    <a href="#">He olvidado mi contraseña</a>
                </div>          
              
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </body>

            </div>
        </div>
</body>
</html>