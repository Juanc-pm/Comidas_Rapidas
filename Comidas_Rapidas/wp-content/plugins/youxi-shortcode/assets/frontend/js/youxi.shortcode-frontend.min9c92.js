(function(a,h,k,l){a.Youxi=a.Youxi||{};var f={leaflet_map:function(b){if("undefined"!==typeof L){var e={center:[0,0],zoom:13,dragging:!0,touchZoom:!0,scrollWheelZoom:!0,zoomControl:!0,attributionControl:!0,scaleControl:!1,style:"mapbox.streets",markers:[]};a(".leaflet-map",b).each(function(){var c=a.extend(!0,{},e,a(this).data("leaflet-options")),b=a(this).data("mapbox-access-token")||"",d=a.data(this,"js-leaflet");d||(d=L.map(this,{center:c.center,zoom:c.zoom,dragging:c.dragging,touchZoom:c.touchZoom,scrollWheelZoom:c.scrollWheelZoom,zoomControl:c.zoomControl,attributionControl:c.attributionControl}),c.scaleControl&&L.control.scale().addTo(d),L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}",{id:c.style,accessToken:b,attribution:'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery &copy; <a href="http://mapbox.com">Mapbox</a>'}).addTo(d),(c.markers||[]).forEach(function(a,c){var b=L.marker([a.lat,a.lng]).addTo(d);a.description&&b.bindPopup(a.description)}),a.data(this,"js-leaflet",d))})}},tooltip:function(b){a.fn.tooltip&&a('[data-toggle="tooltip"]',b).tooltip()}},g={leaflet_map:function(b){a(".leaflet-map",b).each(function(){var b=a.data(this,"js-leaflet");b&&b.remove();a.removeData(this,"js-leaflet")})},tooltip:function(b){a.fn.tooltip&&a('[data-toggle="tooltip"]',b).tooltip("dispose")}};a.extend(a.Youxi,{Shortcode:{setup:function(b){a.each(f,function(e,c){a.isFunction(c)&&c.call(null,b)})},teardown:function(b){a.each(g,function(e,c){a.isFunction(c)&&c.call(null,b)})}}});a(function(){a.Youxi.Shortcode.setup()})})(jQuery,window,document);