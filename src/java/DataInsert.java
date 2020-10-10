
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DataInsert")
public class DataInsert extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        double result = Double.parseDouble(request.getParameter("sub_total"));
        java.util.Date date = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        java.sql.Timestamp sqlTime = new java.sql.Timestamp(date.getTime());
        
        String query = "insert into dailycollection(date,time,collection)"
                + "values(?,?,?)";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com:3306/shopsite", "root", "rootroot");
            PreparedStatement st = con.prepareStatement(query);
            st.setDate(1, sqlDate);
            st.setTimestamp(2, sqlTime);
            st.setDouble(3, result);
            
            st.executeUpdate();        
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("Bill.jsp");
    }
}
