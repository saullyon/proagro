import React, {useState, useEffect} from 'react';
import md5 from 'md5';
import 'bootstrap/dist/css/bootstrap.min.css';
import Cookies from 'universal-cookie';
import axios from 'axios';
import '../css/Login.css'

function Login(props) {
    
    const baseUrl="https://localhost:44338/api/Usuarios";
    
    const cookies = new Cookies();
    
    const [form, setForm]=useState({
        RFC:'',
        Contrasenia: ''
    });
    const handleChange=e=>{
        const {name, value} = e.target
        setForm({
            ...form,
            [name]: value
        });
        console.log(form)
    }
    
    const iniciarSesion=async()=>{

        await axios.get(baseUrl+`/${form.RFC}/${form.Contrasenia}`)
        .then(response=>{
            return response.data;
        }).then(response=>{
            if(response.length>0){
                var respuesta=response[0];
                cookies.set('idUsuario', respuesta.idUsuario, {path: '/'});
                cookies.set('contrasenia', respuesta.contrasenia, {path: '/'});
                cookies.set('nombre', respuesta.nombre, {path: '/'});
                cookies.set('fechaN_C', respuesta.fechaN_C, {path: '/'});
                cookies.set('rfc', respuesta.rfc, {path: '/'});
                alert('Bienvenido ProAgro: ' +respuesta.nombre);

                props.history.push('/menu');
            }else{
                alert('El usuario o la contraseña no son correctos')
            }
        })
        
        .catch(error=>{
            console.log(error);
        })
    }
    
    useEffect(()=>{
        if(cookies.get('idUsuario')){
            props.history.push('/menu');
        }
    },[]);
    
    return (
        <div className="containerPrincipal">
        <h5>Prueba Técnica ProAgro</h5>
        <div className="containerLogin">
        <div className="form-group">
        <label>RFC: </label>
        <br />
        <input 
        type="text"
        className="form-control"
        name="RFC"
        onChange={handleChange}
        />
        <br />
        <label>Contraseña: </label>
        <br />
        <input 
        type="Contrasenia"
        className="form-control"
        name="Contrasenia"
        onChange={handleChange}
        />
        <br />
        <button className="btn btn-success" onClick={()=>iniciarSesion()}>Acceso</button>
        </div>
        </div>
        </div>
        );
    }
    
    export default Login;