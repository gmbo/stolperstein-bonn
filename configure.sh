#!/usr/bin/env sh

npm install

cp ./node_modules/jquery/dist/jquery.min.js page/js/

## Path needs to be corrected
sed -e 's/"images"/"..\/images"/' < ./node_modules/leaflet/dist/leaflet.js > page/js/leaflet.js

cp ./node_modules/leaflet/dist/leaflet.css page/css
cp ./node_modules/leaflet/dist/images/* page/images

cp ./node_modules/leaflet.fullscreen/Control.FullScreen.js page/js
cp ./node_modules/leaflet.fullscreen/icon*.png page/images
cp ./node_modules/leaflet.fullscreen/Control.FullScreen.css page/css

cp ./node_modules/leaflet.markercluster/dist/leaflet.markercluster.js page/js
cp ./node_modules/leaflet.markercluster/dist/MarkerCluster*.css page/css

cp ./node_modules/leaflet-loading/src/Control.Loading.css page/css
cp ./node_modules/leaflet-loading/src/Control.Loading.js page/js

cp ./node_modules/leaflet-minimap/dist/Control.MiniMap.min.css page/css
cp ./node_modules/leaflet-minimap/dist/Control.MiniMap.min.js page/js
cp ./node_modules/leaflet-minimap/dist/images/toggle.* page/images

cp ./node_modules/leaflet-gps/dist/leaflet-gps.min.css page/css
cp ./node_modules/leaflet-gps/dist/leaflet-gps.min.js page/js
cp ./node_modules/leaflet-gps/images/gps-icon.png page/images

cp ./node_modules/osmtogeojson/osmtogeojson.js page/js

cp ./node_modules/leaflet-measure/dist/leaflet-measure.css page/css
cp ./node_modules/leaflet-measure/dist/leaflet-measure.min.js page/js
cp ./node_modules/leaflet-measure/dist/images/* page/images

cp ./node_modules/stolperstein-bonn-proxy/proxy.php page

wget -qO- 'http://stadtplan.bonn.de/geojson?Thema=21247&koordsys=4326' |\
sed -e 's/\([0-9]\{1,\}\.[0-9]\{1,6\}\)[0-9]\{1,\}/\1/g' >\
page/files/Ortsteile_Bonn.geojson

wget -qO- 'http://stadtplan.bonn.de/geojson?Thema=14574&koordsys=4326' |\
sed -e 's/\([0-9]\{1,\}\.[0-9]\{1,6\}\)[0-9]\{1,\}/\1/g' >\
page/files/Stadtbezirke_Bonn.geojson

wget -qO- 'http://stadtplan.bonn.de/geojson?Thema=21248&koordsys=4326' |\
sed -e 's/\([0-9]\{1,\}\.[0-9]\{1,6\}\)[0-9]\{1,\}/\1/g' >\
page/files/Stadt_Bonn.geojson

