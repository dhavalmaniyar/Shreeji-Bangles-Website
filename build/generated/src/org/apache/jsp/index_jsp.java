package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width,user-scalable=no\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/bootstrap.css\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\"></script>\n");
      out.write("        <script src=\"./js/bootstrap.js\"></script>\n");
      out.write("        <title>Login</title>\n");
      out.write("    </head>\n");
      out.write("    ");

        if (session.getAttribute("wrong_uname_pass") != null) {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("\n");
      out.write("        alert(\"wrong user name or password\");\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("    ");

            session.removeAttribute("wrong_uname_pass");
        }

    
      out.write("\n");
      out.write("\n");
      out.write("    ");
        if (session.getAttribute("wrong_npass_cpass") != null) {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("\n");
      out.write("        alert(\"Different : password,confirm password\");\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("    ");

            session.removeAttribute("wrong_npass_cpass");
        }

    
      out.write("\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <section id=\"desktop\" class=\"row\">\n");
      out.write("            <div class=\"col-md-6\" style=\"margin: 0px;\">\n");
      out.write("                <img src=\"./images/shreeji_front_logo.jpg\" style=\"height:100vh;\" alt=\"\">\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-md-6\" style=\"margin: 0px;\">\n");
      out.write("                <div class=\"card\" style=\"top:50px\">\n");
      out.write("                    <img src=\"./images/shreeji.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                    <div class=\"card-body\">\n");
      out.write("                        <form action=\"Login\" method=\"post\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <span id=\"valid\" style=\"color: red;padding:0 22%; display: none;\">incorrect Email or password</span><br>\n");
      out.write("                                <label for=\"exampleInputEmail1\">Email address</label>\n");
      out.write("                                <input type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\"\n");
      out.write("                                       placeholder=\"Enter email\" name=\"email\">\n");
      out.write("                                <small id=\"emailHelp\" class=\"form-text text-muted\">We'll never share your email with anyone else.</small>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"exampleInputPassword1\">Password</label>\n");
      out.write("                                <input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Password\" name=\"pass\" required>\n");
      out.write("                            </div>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-success\">Submit</button>&nbsp;&nbsp;&nbsp;<a href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">change password</a>\n");
      out.write("                        </form>                        \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--Modal-->\n");
      out.write("        <div class=\"modal fade\" id=\"exampleModalCenter\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <h5 class=\"modal-title\" id=\"exampleModalLongTitle\">Change Password</h5>\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                            <span aria-hidden=\"true\">&times;</span>\n");
      out.write("                        </button>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <form method=\"post\" action=\"ChangePassword\">\n");
      out.write("                            <div class=\"form-row\">\n");
      out.write("                                <div class=\"form-group col-md-11\">\n");
      out.write("                                    <label for=\"inputEmail\">Email:</label>\n");
      out.write("                                    <input class=\"form-control\" type=\"email\" name=\"email\" id=\"inputEmail\" placeholder=\"Email\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-5\">\n");
      out.write("                                    <label for=\"currentPassword\">Current Password:</label>\n");
      out.write("                                    <input class=\"form-control\" type=\"password\" name=\"pass\" id=\"currentPassword\" placeholder=\"Current Password\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-6\">\n");
      out.write("                                    <label for=\"newPassword\">New Password:</label>\n");
      out.write("                                    <input class=\"form-control\" type=\"password\" name=\"npass\" id=\"newPassword\" placeholder=\"Password\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-5\">\n");
      out.write("                                    <label for=\"confirmPassword\">Confirm Password:</label>\n");
      out.write("                                    <input class=\"form-control\" type=\"password\" name=\"cpass\" id=\"confirmPassword\" placeholder=\"Confirm Password\" required>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group col-md-6\">\n");
      out.write("                                    <label for=\"adminPassword\">Admin Password:</label>\n");
      out.write("                                    <input class=\"form-control\" type=\"password\" name=\"apass\" id=\"adminPassword\" placeholder=\"Admin Password\" required>\n");
      out.write("                                </div>\n");
      out.write("                            </div>    \n");
      out.write("                            <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Save changes</button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-footer\">\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <section id=\"mobile\">\n");
      out.write("            <div id=\"myCarousel\" class=\"carousel slide \" data-interval=\"2000\"  data-wrap=\"false\" data-ride=\"carousel\">\n");
      out.write("                <div class=\"carousel-inner \">\n");
      out.write("                    <div class=\"carousel-item active\" data-interval=\"1000\">\n");
      out.write("                        <img class=\"d-block w-100 \" style=\"height: 100vh;\" src=\"./images/shreeji_logo.png\" alt=\"First slide\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"carousel-item \">           \n");
      out.write("                        <div class=\"card\" style=\"top:50px;\">\n");
      out.write("                            <img src=\"./images/shreeji.png\" class=\"card-img-top\" alt=\"\">\n");
      out.write("                            <div class=\"card-body\">\n");
      out.write("                                <form action=\"Login\" method=\"post\" >\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"exampleInputEmail1\">Email address</label>\n");
      out.write("                                        <input type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\"\n");
      out.write("                                               placeholder=\"Enter email\" name=\"email\">\n");
      out.write("                                        <small id=\"emailHelp\" class=\"form-text text-muted\">We'll never share your email with anyone\n");
      out.write("                                            else.</small>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"exampleInputPassword1\">Password</label>\n");
      out.write("                                        <input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Password\" name=\"pass\" required>\n");
      out.write("                                    </div>\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success\">Submit</button>&nbsp;&nbsp;&nbsp;<a href=\"#\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">change password</a>\n");
      out.write("                                </form>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </section>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
