ACC.oneStoreNavigation = {
		
_autoload: [
	        "oneStoreNavigation"
    ],
    oneStoreNavigation: function(){
    	
    	   var aOneStoreData = [];
           var oOneStoreData = $('.distNavComponent');


           //the one store hook for the desktop
           var oMMainNavDesktopCom = $(".js-secondaryNavMyDashboard .js-nav__links");
           
           if(oOneStoreData){
               var cLinks = oOneStoreData.find("a");
               for(var i = 0; i < cLinks.length; i++){
            	   aOneStoreData.push({link: cLinks[i].href, text: cLinks[i].title});
               }
           }


           if (aOneStoreData.length > 0)
        	{
	           	
	        	 $( ".myAccountLinksHeader" ).css( "display", "none" );
	        	
	        	$( ".myCompanyLinksHeader" ) .css( "display", "none" );
	        	
        	 }
           
         //create Welcome User + expand/collapse and close button
           //This is for mobile navigation. Adding html and classes.
           var oUserInfo = $(".js-logged_in");
           //Check to see if user is logged in
           if(oUserInfo && oUserInfo.length === 1 && aOneStoreData.length > 0)
           {

        	   //FOR DESKTOP
               var myOneStoreHook = $('<a class=\"myDashboardLinksHeader js-myDashboard-toggle\"  data-toggle=\"collapse\" data-parent=".nav__right" >' + oOneStoreData.data("title") + '</a>' );
               myOneStoreHook.insertBefore(oOneStoreData);
               
               //*For toggling collapse myAccount on Desktop instead of with Bootstrap.js
               $('.myDashboardLinksHeader').click(function () {
                   $(this).toggleClass('show');
                   $(".js-secondaryNavMyDashboard").slideToggle(400); 
                   if ( $(this).hasClass('show') ) {
                       $('.myAccountLinksHeader').removeClass('show'); // hide the other one
                       $('.myCompanyLinksHeader').removeClass('show'); 
                       $('.js-secondaryNavCompany').slideUp(400);
                   }
                   return false;
               });
               
               $('.js-userAccount-Links').append($('<li class="auto"><div class="myDashboardLinksContainer js-myDashboardLinksContainer"></div></li>'));
               
               var myOneStoreHook = [];
               myOneStoreHook.push('<div class="sub-nav">')
               myOneStoreHook.push('<a id="signedInMyDashboardToggle" class="myDashboardLinksHeader collapsed js-myDashboard-toggle"  data-toggle="collapse" data-target=".offcanvasGroup3">');
               myOneStoreHook.push(oOneStoreData.data("title"));
               myOneStoreHook.push('<span class="glyphicon glyphicon-chevron-down myDashboardExp"></span>');
               myOneStoreHook.push('</a>');
               myOneStoreHook.push('</div>');
               $('.js-myDashboardLinksContainer').append(myOneStoreHook.join(''));

               //add UL element for nested collapsing list
               $('.js-myDashboardLinksContainer').append($('<ul data-trigger="#signedInMyDashboardToggle" class="js-myDashboard-root offcanvasGroup3 offcanvasNoBorder subNavList js-nav-collapse-body  collapse sub-nav "></ul>'));

               //One Store links for desktop
               
             //*For toggling collapse on Mobile instead of with Bootstrap.js
               $('#signedInMyDashboardToggle').click(function () {
                   $(this).toggleClass('show');
                   $(".offcanvasGroup3").slideToggle(400);
                   if ( $(this).hasClass('show') ) {
                       $(this).find('span').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
                       $('#signedInAccountToggle').removeClass('show'); // hide the other one
                       $('#signedInCompanyToggle').find('span').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
                       $('.offcanvasGroup4').slideUp(400);
                   }
                   else {
                       $(this).find('span').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
                   }
               });

               for(var i = aOneStoreData.length - 1; i >= 0; i--){
                   var oLink = oDoc.createElement("a");
                   oLink.title = aOneStoreData[i].text;
                   oLink.href = aOneStoreData[i].link;
                   oLink.innerHTML = aOneStoreData[i].text;

                   var oListItem = oDoc.createElement("li");
                   oListItem.appendChild(oLink);
                   oListItem = $(oListItem);
                   oListItem.addClass("auto ");
                   $('.js-myDashboard-root').append(oListItem);
               }

           }
           //desktop
    	
           for(var i = 0; i < aOneStoreData.length; i++){
               var oLink = oDoc.createElement("a");
               oLink.title = aOneStoreData[i].text;
               oLink.href = aOneStoreData[i].link;
               oLink.innerHTML = aOneStoreData[i].text;

               var oListItem = oDoc.createElement("li");
               oListItem.appendChild(oLink);
               oListItem = $(oListItem);
               oListItem.addClass("auto col-md-4");
               oMMainNavDesktopCom.get(0).appendChild(oListItem.get(0));
           }
           
           
    }
		
};