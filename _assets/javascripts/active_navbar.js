/*jslint browser: true */
/* manage active navbar:
 *  match root of active page with one of the navbar menu items
 *  i.e. '/posts/ace.html' with '/posts/static/web/jekyll/2015/01/02/welcome-to-pru.html'
 *  NOTE: always put a category 'posts' as first category for a post!!!
 */
(function () {
    'use strict';

    var baseurl = $('div.navbar-brand a').attr("href").split("/");
    baseurl.splice(0, 3);
    baseurl.pop();
    baseurl = baseurl == "" ? baseurl : "/" + baseurl.join("/");

    function stripBaseURL(base, path) {
        if (base === "") return path;
        // strip baseurl
        var re = new RegExp("^" + base);
        return path.replace(re, "");
    }

    function getMenu(path) {
        var b = path.split("/");
        return "/" + b[1] + "/";
    }

    $(
        function () {
            var activePage = window.location.pathname;
            // remove baseurl part before matching
            activePage = stripBaseURL(baseurl, activePage)
            var activeMenu = getMenu(activePage);
            $('.nav li a').each(function () {
                var currentNav = $(this)[0].pathname;
                currentNav = stripBaseURL(baseurl, currentNav)
                if (activeMenu === currentNav) {
                    $(this).parent().addClass('active');
                    return false; // break the loop
                }
            });
        }
    );
}());
