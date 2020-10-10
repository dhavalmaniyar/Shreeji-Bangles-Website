
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEntry")
public class DeleteEntry extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int record = Integer.parseInt(request.getParameter("mess"));
        String query = "update invest set delete_on = curdate() where id=' "+ record + "'";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com:3306/shopsite", "root", "rootroot");
            Statement st = con.createStatement();
            st.executeUpdate(query);
            con.close();
            st.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("invest.jsp");
    }
}
