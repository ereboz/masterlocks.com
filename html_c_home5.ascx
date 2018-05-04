<%--
********************************************************************************************************************
Ignify eCommerce Catalog Views
Ignify, Inc
http://www.ignify.com
********************************************************************************************************************
Last Modified: Mar 15, 2017

Purpose
========
This is the template for the home page of the GadgetsOnline store. This template contains a number of unrelated views to form the home page.
You can layout the body of the home page as desired by using any number of existing HTML files from the Views folder to form 
the content. Here, a variable with name 'currentlyeditingtemplate' is used to define the name of this view. This is helpful
while finding which home template is used for a particular store.

Banners are displayed here using JQuery. These banners are added in static content blocks with names 
'Hodge_homebanner1','Hodge_homebanner2' and 'Hodge_homebanner3','Hodge_homebanner4'.JQuery is written here - (inside function $(window).load(function (){}) - to improve performance of home page.
Navigation is provided for the banners using Jquery to scroll horizontally.

Further this view contain Product Widget such as 'featuredproduct','mostpopular','bestseller','onsale','newarrival'. 
These Widget are configured via manager panel, Widget heading can be configured via manager panel.
For each Widget respective views are loaded like 'html_featuredproducts2','html_bestsellers1','html_mostpopular2','html_onsale1','html_newarrivals1'.
HTML/script is included to display the FaceBook 'Like' content.                       
News Feed is also available on this page. It has live RSS News Feed from yahoo sports page. This call is made using JQuery.
It displays the top 5 News Feed and also has a link to the yahoo sports news feed page for more news.
Static content blocks are available with names 'dealoftheday'.

Live chat box is also available where user can chat with customer care for there Query. This chat box is loaded with the help of JavaScript.
User can also use toll free number to contact customer care which available with chat, With this news letter subscription widget is also loaded.
Search box is provided for user to search related thing for store. 
Changed the position of "topbrands_content1" as per the client requirment.          

For facebook widget href has been specified as hardcoded (https://www.facebook.com/ignify2012).

    Made changes to HTML to manage carousal UI.

Static Content Block
========================
You can add/modify static content blocks using the Html.RenderAction method. 
Here, the method line will be the same for all static content blocks, with only a change in the ID.
In gethtml_staticcontent("ID"), the ID will be name of the static content block created from the manager panel.
=================
HTML Slider Banner 
=======================

HTML Wrapper Element
========================
The container for this file is the catalog master template.

1) Removed 'mostpopular','onsale','newarrival'. contain Product Widget.
2) Added one new featuredproduct conain widget in div="featuredproducts_mobile" for Mobile devices.
3) Added 3 new static content  1) topbrands_content1, 2) topbrands_content2 3) resource_center

    Added most popular widget. Modified topbrands_content1 HTML and content to add carousel. Removed boldhead class from featured products 2 title

--%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ignify.eCommerce.Web.Store.ViewHelper.WidgetBase< Ignify.eCommerce.Web.Store.ViewModels.ProductSearchOutput>" %>
<%@ Import Namespace="System.Web.Mvc" %>
<script type="text/javascript">
    <%--// This variable is assumed to be declared on the corresponding Master page--%>
    currentlyeditingtemplate = "<%=Html.CurrentViewName() %>";
    var tabproducts = [];
    var HomeWidgets = [];
    function createtabs()
    { }
</script>
<%ViewData["imagedimensionoverride"] = "300X340"; %>

<%--<!-- This bannercontainer DIV is being used to attach FeaturedProducts BELOW the banner when the page loads. But for SEO it should come at the top-->
    <!-- So do not remove the bannercontainer DIV (see script at the end of this page.)-->--%>
<!-- Banner Box Start -->
<div id="homepagebanners" class="banner carousel slide" style="display: none; -ms-touch-action: none;">
    <div class="leftHalf"></div>
    <div id="banners" class="carousel-inner"></div>
    <ol id="banners_navigation" class="carousel-indicators"></ol>
    <div class="container">
        <a class="left carousel-control" href="#homepagebanners" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="right carousel-control" href="#homepagebanners" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>
    </div>
</div>
 <!-- Banner Box End -->

<div class="homeproductlistscontainer" style="visibility: hidden">
    <div class="container">
        <div class="row">
            <div class="col-xl-12 col-md-12 col-sm-12 col-xs-12">
                <div class="topbrands brandcontainer">
                    <div class="brandscarousel">
                        <%Html.RenderAction("gethtml_staticcontent", "store", new RouteValueDictionary { { "contentblockid", "topbrands_content1" }, { "viewname", "html_staticcontent2" } });%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="productlistpane">
                <h2 class="bestsellers">
                    <%Html.RenderAction("gethtml_staticcontent", "store", new RouteValueDictionary { { "contentblockid", "featured_title_row3" }, { "viewname", "html_staticcontent2" } });%>
                </h2>
                <div id="bestsellers" <%=getAjaxDecoration("HomeWidgets","AjaxFrameworkScript") %>>
                    <%Html.RenderAction("RenderWidget", "Widget", new RouteValueDictionary{
                            {"controllerName","category"},
                            {"actionMethod","gethtml_bestsellers"},
                            {"parameters", new Hashtable() { { "param1", "10" }, { "param2", Model.CategoryId } , { "param3", "html_bestsellers1"}, {"param4", Convert.ToString(ViewData["imagedimensionoverride"])}}},
                            {"widgetContainerID","bestsellers"},
                            {"widgetArrayName","HomeWidgets"},
                            {"widgetID","3"},
                            {"widgetOrder","3"},
                            {"widgetname","bestsellers"},
                            {"useAjax",false}
                    }); %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="productlistpane">
                <h2 class="featuredproducts">
                    <%Html.RenderAction("gethtml_staticcontent", "store", new RouteValueDictionary { { "contentblockid", "featured_title_row1" }, { "viewname", "html_staticcontent2" } });%>
                </h2>
                <div id="featuredproducts" <%=getAjaxDecoration("HomeWidgets","AjaxFrameworkScript") %>>
                    <%Html.RenderAction("RenderWidget", "Widget", new RouteValueDictionary{
                            {"controllerName","category"},
                            {"actionMethod","gethtml_featuredproducts"},
                            {"parameters", new Hashtable() { { "param1", "15" }, { "param2", Model.CategoryId } , { "param3", "html_featuredproducts2" }, {"param4", Convert.ToString(ViewData["imagedimensionoverride"])}}},
                            {"widgetContainerID","featuredproducts"},
                            {"widgetArrayName","HomeWidgets"},
                            {"widgetID","1"},
                            {"widgetOrder","1"},
                            {"widgetname","featuredproducts"},
                            {"useAjax",false}
                    }); %>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="productlistpane">
                <h2 class="mostpopular">
                    <%Html.RenderAction("gethtml_staticcontent", "store", new RouteValueDictionary { { "contentblockid", "featured_title_row2" }, { "viewname", "html_staticcontent2" } });%>
                </h2>
                <div id="mostpopular" <%=getAjaxDecoration("HomeWidgets","AjaxFrameworkScript") %>>
                    <%Html.RenderAction("RenderWidget", "Widget", new RouteValueDictionary{
                            {"controllerName","category"},
                            {"actionMethod","gethtml_mostpopular"},
                            {"parameters", new Hashtable() { { "param1", "15" },{ "param2", Model.CategoryId },{ "param3", "0" },{ "param4", "html_mostpopular2" }, {"param5", Convert.ToString(ViewData["imagedimensionoverride"])}  }},
                            {"widgetContainerID","mostpopular"},
                            {"widgetArrayName","HomeWidgets"},
                            {"widgetID","2"},
                            {"widgetOrder","2"},
                            {"widgetname","mostpopular"},
                            {"useAjax",false}
                    }); %>
                </div>
            </div>
        </div>
        
        <%--javaboxer START carousel for laminated padlocks--%>
            <!-- start laminated padlock grid -->
            <div id="laminated-padlocks-grid" class="banner carousel slide" style="display: none; -ms-touch-action: none;">
                <div class="leftHalf"></div>
                <div id="banners2" class="carousel-inner"></div>
                <ol id="banners_navigation2" class="carousel-indicators"></ol>
                <div class="container">
                    <a class="left carousel-control" href="#homepagebanners" role="button" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="right carousel-control" href="#homepagebanners" role="button" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>
            </div>
             <!-- end laminated padlock grid -->
        <%--javaboxer END carousel for laminated padlocks--%>
        

        <div class="row">
            <div class="laminated-padlocks">
                <%Html.RenderAction("gethtml_staticcontent", "store", new RouteValueDictionary { { "contentblockid", "laminated-padlocks" } });%>
            </div>
        </div>

        <div class="row">
            <div class="topbrands_content2">
                <%Html.RenderAction("gethtml_staticcontent", "store", new RouteValueDictionary { { "contentblockid", "topbrands_content2" } });%>
            </div>
        </div>
        
    </div>

    <%Html.RenderAction("gethtml_staticcontent", "store", new RouteValueDictionary { { "contentblockid", "resource_center" } });%>
    <div class="container">
        <div class="row">
            <div class="topbrands brandcontainer">
                <div class="brandscarousel">
                    <%Html.RenderAction("gethtml_staticcontent", "store", new RouteValueDictionary { { "contentblockid", "topbrands_content1" }, { "viewname", "html_staticcontent2" } });%>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("document").ready(function () {
        $(".brandscarousel").owlCarousel({
            items: 5,
            itemsCustom: [[0, 1], [480, 2], [768, 3], [1024, 4], [1100, 5], [1600, 6]],
            lazyLoad: true,
            navigation: true,
            rewindNav: false,
            responsive: true,
            scrollPerPage: true,
            navigationText: ["<div class=\"previousitem\"></div>", "<div class=\"nextitem\"></div>"]
        });
    });
    function AddNewBanner(response) {
        var bannerCount = $("#banners_navigation > li").length;
        var classtoAdd = "";
        if (bannerCount == 0)
            classtoAdd = "active";

        $("#banners").append('<div class="item ' + classtoAdd + '">' + response + '</div>');

        $("#banners_navigation").append('<li data-target="#homepagebanners" data-slide-to="' + bannerCount + '" class="' + classtoAdd + '"></li>');

    }
    /* <![CDATA[ */
    $(window).load(function () {
        $.get(homeUrl + "widgets-store/gethtml_staticcontent?contentblockid=Hodge_homebanner1", function (response) { AddNewBanner(response); }).complete(function () {
            $.get(homeUrl + "widgets-store/gethtml_staticcontent?contentblockid=Hodge_homebanner2", function (response) { AddNewBanner(response); }).complete(function () {
                $.get(homeUrl + "widgets-store/gethtml_staticcontent?contentblockid=Hodge_homebanner3", function (response) { AddNewBanner(response); }).complete(function () {
                    $.get(homeUrl + "widgets-store/gethtml_staticcontent?contentblockid=Hodge_homebanner4", function (response) { AddNewBanner(response); }).complete(function () {

                        $('#homepagebanners').carousel({
                            interval: 5000
                        });

                        $('#homepagebanners').show();
                        $(".homeproductlistscontainer").css("visibility", "visible");

                        $('#homepagebanners').swiperight(function () {
                            $("#homepagebanners").carousel('prev');
                        });
                        $('#homepagebanners').swipeleft(function () {
                            $("#homepagebanners").carousel('next');
                        });

                    });
                });
            });
        });

    });
    /* ]]>*/
</script>
