const getLocations = () => {
    fetch('https://localhost:44338/api/Georreferencias/')
    .then(response => response.json())
    .then(locations => {
        let locationsInfo = []
        
        locations.forEach(location => {
            let locationData = {
                position:{lat:location.latitud,lng:location.longitud},
                name:location.nombre_sede                
            }
            locationsInfo.push(locationData)
        })
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition((data)=>{
                let currentPosition = {
                    lat: data.coords.latitude,
                    lng: data.coords.longitude
                }
                dibujarMapa(currentPosition, locationsInfo)
            })
        }
    })
}

const dibujarMapa = (obj, locationsInfo) => {
   let map = new google.maps.Map(document.getElementById('map'),{
        zoom: 4,
        center: obj
    })

    let marker = new google.maps.Marker({
        position: obj,
        title: 'Tu ubicacion'
    })
    marker.setMap(map)

    let markers = locationsInfo.map(place => {
        return new google.maps.Marker({
            position: place.position,
            map: map,
            title: place.name
        })
    })
}
window.addEventListener('load',getLocations)