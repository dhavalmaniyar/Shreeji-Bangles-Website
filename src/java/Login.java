
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

@WebServlet("/Login")

public class Login extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String uname = request.getParameter("email");
        String pass = request.getParameter("pass");
        String query = "select username,password from login where username = ? and password = ?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com:3306/shopsite", "root", "rootroot");
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("uname", rs.getString("username"));
                response.sendRedirect("Bill.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("location='index.jsp';");
                out.println("alert('User or password incorrect');");
                out.println("</script>");

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

//        if (uname.equals("dhavalmaniyar123@gmail.com") && pass.equals("dhaval")) {
//            HttpSession session = request.getSession();
//            session.setAttribute("uname", uname);
//            request.setAttribute("uname", uname);
//            response.sendRedirect("daily.jsp");
//        } else {
//            PrintWriter out = response.getWriter();
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('User or password incorrect');");
//            out.println("location='index.jsp';");
//            out.println("</script>");
//            response.sendRedirect("index.jsp");
    }
}

