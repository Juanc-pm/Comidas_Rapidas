(function(a,d,k){var f=a(k),l=a(d),g=a(k.body),b=d.Helium=d.Helium||{};a.extend(b,d._helium||{},{isHandheld:!(!bowser.mobile&&!bowser.tablet),mql:d.matchMedia&&d.matchMedia("(min-width: 992px)"),init:function(){b.isHandheld||a("html").addClass("desktop");b.setupListeners();a(b.ready)},ready:function(){b.setup();b.onResize()},onResize:function(){b.adjustFullscreenContent();a(".main-nav").find("ul").css("display","").end().find(".sub-menu-open").removeClass("sub-menu-open")},onMqlChange:function(b){f.off(".hoverIntent .helium.nav");
if(b.matches)a.fn.hoverIntent&&f.hoverIntent({over:function(){a(this).children("ul.sub-menu").finish().slideDown().closest(".menu-item").addClass("sub-menu-open")},out:a.noop,selector:".main-nav .menu-item-has-children"}),f.on("click.helium.nav",".menu-item.sub-menu-open .subnav-close",function(b){a(this).closest(".menu-item").removeClass("sub-menu-open");a(this).siblings("ul.sub-menu").finish().slideUp(function(){a(this).find("ul.sub-menu").hide();a(this).find(".sub-menu-open").addBack().removeClass("sub-menu-open")})});
else f.on("click.helium.nav",".header-toggle",function(a){g.toggleClass("header-open");a.preventDefault()}).on("click.helium.nav",".main-nav .menu-item a",function(){g.removeClass("header-open")})},setupListeners:function(){l.on("resize.helium orientationchange.helium",b.onResize);g.on("edd_cart_item_added",function(b,d){var h=a("<div></div>").append(d.cart_item).find(".edd-cart-item").data("cart-quantity");a(".header-links .edd-shopping-cart .header-links-tooltip").text(h)});f.on("click.helium.btt",
".back-to-top > .btn",function(b){a("html,body").finish().animate({scrollTop:0},500);b.preventDefault()});(function(){var e=function(){a(".search-wrap .search-form").length&&a(".search-wrap .search-form")[0].reset();g.addClass("search-open");f.on("keyup.helium.search",function(a){27==a.keyCode&&d()})},d=function(){g.removeClass("search-open");f.off("keyup.helium.search")};f.on("click.helium.search",".header-links .ajax-search-link a",function(a){e();a.preventDefault()});if(b.ajax&&b.ajax.enabled)f.on("submit",
".search-open .search-wrap .search-form",function(h){var m=b.homeUrl+"?s="+a(".form-control",this).val();d();History&&History.pushState(null,null,m);h.preventDefault()})})();b.mql&&(b.mql.addListener(b.onMqlChange),b.onMqlChange(b.mql))},adjustFullscreenContent:function(d){a(".content-area.fullscreen .content-wrap",d).each(function(){a(this).css({height:l.height()-(b.mql.matches?0:a(this).offset().top)})})},setup:function(e){b.adjustFullscreenContent(e);a.fn.royalSlider&&a(".royalSlider",e).each(function(){a(this).royalSlider(a.extend(!0,
{},a(this).data("rs-settings"),{slidesSpacing:0,imageScalePadding:0,keyboardNavEnabled:!0,addActiveClass:!0}))});a.fn.isotope&&a(".gallery",e).each(function(){a(this).imagesLoaded(function(){a(this).isotope({layoutMode:"packery",itemSelector:".gallery-item",packery:{gutter:10}})})});a.fn.justifiedGrids&&a(".justified-grids",e).justifiedGrids();a.fn.heliumGridList&&a(".grid-list",e).heliumGridList({afterAppend:function(h,b){a(this).is(".edd-download-grid")&&(a(".edd-no-js",b).hide(),a("a.edd-add-to-cart",
b).addClass("edd-has-js"))}});a.fn.magnificPopup&&(f.magnificPopup({delegate:".mfp-trigger",type:"image"}),a.each({".grid-list":{delegate:".grid-list-mfp"},".gallery":{delegate:'.gallery-item a[href*="wp-content"]',image:{titleSrc:function(a){return a.el.closest(".gallery-item").find(".gallery-caption").html()||""}}},".tiled-gallery":{delegate:'.tiled-gallery-item a[href*="wp-content"]',image:{titleSrc:function(a){return a.el.closest(".tiled-gallery-item").find(".tiled-gallery-caption").html()||""}}}},
function(h,b){a(h,e).magnificPopup(a.extend(!0,{type:"image",gallery:{enabled:!0}},b))}));a.fn.magnificPopup&&(b.TeamTemplate=b.TeamTemplate||new Hogan.Template(function(a,b,d){this.b(d=d||"");this.s(this.f("photo",a,b,1),a,b,0,10,82,"{{ }}")&&(this.rs(a,b,function(a,b,c){c.b('<figure class="team-photo"><img src="');c.b(c.v(c.f("photo",a,b,0)));c.b('" alt="');c.b(c.v(c.f("name",a,b,0)));c.b('"></figure>')}),a.pop());this.b('<div class="team-info"><div class="team-header"><h3 class="team-name">');
this.b(this.v(this.f("name",a,b,0)));this.b("</h3>");this.s(this.f("role",a,b,1),a,b,0,184,217,"{{ }}")&&(this.rs(a,b,function(a,b,c){c.b('<p class="team-role">');c.b(c.v(c.f("role",a,b,0)));c.b("</p>")}),a.pop());this.b("</div>");this.s(this.f("content",a,b,1),a,b,0,244,291,"{{ }}")&&(this.rs(a,b,function(a,b,c){c.b('<div class="team-description">');c.b(c.v(c.f("content",a,b,0)));c.b("</div>")}),a.pop());this.s(this.f("has_social",a,b,1),a,b,0,318,453,"{{ }}")&&(this.rs(a,b,function(a,b,c){c.b('<div class="team-social"><ul class="inline-list">');
c.s(c.f("social_profiles",a,b,1),a,b,0,367,422,"{{ }}")&&(c.rs(a,b,function(a,b,c){c.b('<li><a href="');c.b(c.v(c.f("url",a,b,0)));c.b('"><i class="');c.b(c.v(c.f("icon",a,b,0)));c.b('"></i></a></li>')}),a.pop());c.b("</ul></div>")}),a.pop());this.b("</div>");return this.fl()}),a(".team .team-photo a",e).magnificPopup({gallery:{enabled:!0},inline:{markup:'<div class="team-popup"></div>'},callbacks:{elementParse:function(b){if(b.el){var d=a(b.el).closest(".team").data("team-data");d&&(b=a.extend(!0,
b,{data:d}),delete b.src,delete b.el)}return b},markupParse:function(a,d,e){a.empty().html(b.TeamTemplate.render(d))}}}));a.fn.fitVids&&a(".featured-content, .post-media",e).fitVids();"undefined"!==typeof addthis&&addthis.toolbox(".addthis_toolbox");a("div.wpcf7 > form",e).each(function(){var b=a(".wpcf7-response-output",this);b.prependTo(b.closest(".wpcf7-form"));e&&"undefined"!==typeof wpcf7&&wpcf7.initForm(this)});if(e){if(b.EDD&&(b.EDD.ajaxDisabled||(a(".edd-no-js",e).hide(),a("a.edd-add-to-cart",
e).addClass("edd-has-js")),d.edd_scripts)){var g=b.EDD.checkoutPage==d.location.href;d.edd_scripts.redirect_to_checkout=b.EDD.straightToCheckout||g?"1":"0"}a.Youxi&&a.Youxi.Shortcode&&a.Youxi.Shortcode.setup(e);d.wp&&d.wp.mediaelement&&d.wp.mediaelement.initialize();d.WPPlaylistView&&a(".wp-playlist",e).each(function(){return new d.WPPlaylistView({el:this})})}}});b.init()})(jQuery,window,document);