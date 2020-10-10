
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String npass = request.getParameter("npass");
        String cpass = request.getParameter("cpass");
        String apass = request.getParameter("apass");
        String query = "select username,password from login where username=? and password=?";
        PreparedStatement ps;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com:3306/shopsite", "root", "rootroot");
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (npass.equals(cpass) && apass.equals("dhaval777")) {
                    ps = con.prepareStatement("update login set password = ? where username = ?");
                    ps.setString(1, npass);
                    ps.setString(2, email);
                    ps.executeUpdate();
                    con.close();
                    ps.close();
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("location='index.jsp';");
                    out.print("alert('Password changed')");
                    out.println("</script>");

                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("wrong_npass_cpass", "1");
                    response.sendRedirect("index.jsp");
                }
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("wrong_uname_pass", "1");
                response.sendRedirect("index.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
