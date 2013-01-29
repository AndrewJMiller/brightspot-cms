<%@ page import="

com.psddev.cms.tool.Search,
com.psddev.cms.tool.SearchResultRenderer,
com.psddev.cms.tool.ToolPageContext,

com.psddev.dari.db.State,
com.psddev.dari.util.HtmlWriter,
com.psddev.dari.util.PaginatedResult,
com.psddev.dari.util.StringUtils,

java.util.Iterator,
java.util.UUID
" %><%

ToolPageContext wp = new ToolPageContext(pageContext);

if (wp.requireUser()) {
    return;
}

Search search = new Search(wp);

if (!wp.param(boolean.class, "widget")) {
    new SearchResultRenderer(wp, search).render();

} else {
    HtmlWriter writer = new HtmlWriter(wp.getWriter());
    String url = wp.url("/misc/search.jsp");
    String queryString = request.getQueryString();

    if (queryString != null) {
        url += "?" + queryString;
    }

    writer.start("ul", "class", "pagination");
        writer.start("li");
            writer.start("a",
                    "class", "action-result",
                    "href", StringUtils.addQueryParameters(url, "widget", null),
                    "target", "miscSearch");
                writer.html("Search Result");
            writer.end();
        writer.end();
    writer.end();
}
%>
