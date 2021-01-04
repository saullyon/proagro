import React, { useState, useEffect } from "react";
import Cookies from 'universal-cookie';
import '../css/Menu.css';
import axios from 'axios';
import ReactMapGL, { Marker, Popup } from "react-map-gl";
import * as parkDate from "../data/geo.json";

function Menu(props) {
    const baseUrlP="https://localhost:44338/api/Permisos";
    const baseUrlG="https://localhost:44338/api/Georreferencias";
    const cookies = new Cookies();
    const cerrarSesion=()=>{
        cookies.remove('idUsuario', {path:'/'});
        cookies.remove('contrasenia', {path:'/'});
        cookies.remove('nombre', {path:'/'});
        cookies.remove('fechaN_C', {path:'/'});
        cookies.remove('rfc', {path:'/'});
        cookies.remove('idEstado', {path:'/'});
        cookies.remove('estado', {path:'/'});
        cookies.remove('idGeorreferencia', {path:'/'});
        props.history.push('./');
    }
    const permiso=async()=>{
        await axios.get(baseUrlP+`/${cookies.get('idUsuario')}/*`)
        .then(response=>{
            return response.data;
        }).then(response=>{
            if(response.length>0){
                var respuesta=response[0];
                console.log('idEstado '+respuesta['idEstado'])
                console.log('Estado '+respuesta['estados']['estado'])
                cookies.set('idEstado', respuesta.idEstado, {path: '/'});
                cookies.set('estado', respuesta.estados.estado, {path: '/'});
                // cookies.set('idEstado', respuesta.idEstado, {path: '/'});
            }else{
                alert('No carga permiso')
            }
        }).catch(error=>{
            console.log(error);
        })
        window.location.reload();
    }
    const geo=async()=>{
        
        await axios.get(baseUrlG+`/${cookies.get('idEstado')}/*`)
        .then(response=>{
            return response.data;
        }).then(response=>{
            response.forEach((element) => {
                console.log('idGeorreferencia '+element['idGeorreferencia']);
                // console.log('EstadoID '+element['idEstado']);
                console.log('latitud '+element['latitud']);
                console.log('longitud '+element['longitud']);
                // cookies.set('idGeorreferencia', element.idGeorreferencia, {path: '/'});
                // cookies.set('latitud', element.latitud, {path: '/'});
                // cookies.set('longitud', element.longitud, {path: '/'});
            });
        }).catch(error=>{
            console.log(error);
        })
        
    }
    
    geo();
    useEffect(()=>{
        if(!cookies.get('idUsuario')){
            props.history.push('./');
        }
    },[]);
    
    const [viewport, setViewport] = useState({
        latitude: 23.634501,
        longitude: -102.552784,
        width: "100vw",
        height: "100vh",
        zoom: 5
    });
    
    
    return (
        
        <div className="containerMenu" onClick={e => {
            e.preventDefault();
            permiso();
          }}>
        <br />
        <button className="btn btn-danger" onClick={()=>cerrarSesion()}>Cerrar Sesión</button>
        <br />
        {/* <button className="btn btn-warning" onClick={()=>permiso()}>Cargar permiso</button> */}
        <br/>
        <h5>BIENVENIDO ProAgro</h5>
        <h5>ID: {cookies.get('idUsuario')}</h5>
        <h5>Contraseña: {cookies.get('contrasenia')}</h5>
        <h5>Nombre: {cookies.get('nombre')}</h5>
        <h5>Fecha: {cookies.get('fechaN_C')}</h5>
        <h5>RFC: {cookies.get('rfc')}</h5>
        {/* <h5>idEstado: {cookies.get('idEstado')}</h5> */}
        <h5>Estado: {cookies.get('estado')}</h5>
        {/* <h5>idGeorreferencia: {cookies.get('idGeorreferencia')}</h5> */}
        <br/>
        <div>
        <ReactMapGL {...viewport} 
        mapboxApiAccessToken='pk.eyJ1Ijoic2F1bGx5b24iLCJhIjoiY2tqaHpqcnR4MDA1eTJ4cXloZXpubzdobCJ9.ctvoU2BBkZnMAq2CDvoR-Q'
        mapStyle="mapbox://styles/saullyon/ckjhzzaxw1q4g19oa885rdd8r"
        onViewportChange={viewport =>{
            setViewport(viewport)
        }}
        >    
          {parkDate.features.map(park => (
          <Marker
            key1={park.estados.idEstado}
            latitude={park.latitud}
            longitude={park.longitud}
          >
            <button
              className="marker-btn"
            >
              <img src="/location.svg" alt="Point" />
            </button>
          </Marker>
        ))}
            </ReactMapGL>
            </div>
            <br/>
            </div>
            );
        }
        
        export default Menu;