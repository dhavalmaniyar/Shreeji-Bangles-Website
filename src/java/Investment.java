
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/investment")
public class Investment extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        LocalDate date = LocalDate.now();
        String invest = request.getParameter("invest");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String query =  "insert into invest(date,investment,amount) values('"+date+"','"+invest+"',"+amount+")";        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com:3306/shopsite", "root", "rootroot");
            Statement st=con.createStatement();
            st.execute(query);
            st.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("invest.jsp");
    }
}
