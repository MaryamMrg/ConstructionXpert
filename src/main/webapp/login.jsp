
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>

<style>

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .navbar {
        margin-bottom: 20px;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
    }

    .col-md-4 {
        flex: 1 1 40%;
        margin: auto;
        padding: 15px;
    }

    .col-md-8 {
        flex: 1 1 60%;
    }

    img {
        width: 100%;
        height: auto;
    }


    @media only screen and (max-width: 768px) {
        .col-md-4 {
            flex: 1 1 100%;
            margin-bottom: 20px;
        }

        .col-md-8 {
            flex: 1 1 100%;
        }

        .card-title {
            font-size: 18px;
        }

        button {
            width: 100%;
        }
    }
</style>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-warning" style="margin: 0">
    <div class="container">
        <a class="navbar-brand" href="#">ConstructionXpert</a>
    </div>
</nav>

<div class="row" style="width: 100%; margin: 0 ;">
    <div class="col-md-4">

        <div class="card-body">
            <h2 class="card-title text-center mb-4">Connect to your Account</h2>
            <form action="login" method="post">
                <label for="username" class="form-label">User Name</label>
                <input type="text" class="form-control" id="username" name="username">
                <span class="help-block" style="color: red ; margin-bottom: 15px" id="msj" >champ obligatoire </span><br>
                <label for="password" class="form-label">PassWord</label>
                <input type="password" class="form-control" id="password" name="password" >
                <span class="help-block" style="color: red ; margin-bottom: 15px" id="msjj" >champ obligatoire </span><br>

                <button type="submit" class="btn btn-primary" style="float: right ; margin-bottom: 15px">Login</button>
            </form>
        </div>
    </div>



</div>
<script>
    const usr = document.getElementById('username');
    const psw = document.getElementById('password');
    msj = document.getElementById('msj');
    msjj = document.getElementById('msjj');

    usr.addEventListener('input',function(){
        if(usr.value!=='' && usr.value!==null && usr.value.length>3){
            msj.textContent='valide';
            msj.style.color='green';

        }else{
            msj.textContent='champ obligatoire !'
            msj.style.color='red';


        }

    })
    psw.addEventListener('input',function(){
        if(psw.value!=='' && psw.value!==null && psw.value.length>2){
            msjj.textContent='valide';
            msjj.style.color='green';

        }else{
            msjj.textContent='champ obligatoire !'
            msjj.style.color='red';


        }

    })

</script>

</body>
</html>