package Pack1;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CalculateTotal")
public class CalculateTotal extends HttpServlet {

	private Connection con;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {

			String[] totalamount = request.getParameterValues("total");
			String[] products = request.getParameterValues("product");
			//String[] prices = request.getParameterValues("price");
			String[] quantites = request.getParameterValues("quantity");


			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product", "root", "root@123");
			String insertTableSQL = "INSERT INTO product.`product_entry` (product_id,product_name,quantity,total_cost) VALUES(?,?,?,?)";
			PreparedStatement preparedStatement = con.prepareStatement(insertTableSQL);
			
						System.out.println("----jjjkkk");
			for (int i=0; i<products.length; i++)
			{
				System.out.println(products[i] + " " + quantites[i]);
				System.out.println("hhhhhh");
				preparedStatement.setInt(1,4);
				preparedStatement.setString(2, products[i]);
				preparedStatement.setInt(3, Integer.parseInt(quantites[i]));
				preparedStatement.setInt(4,Integer.parseInt(totalamount[i]));
				preparedStatement.addBatch();
			}
			int[] aa=preparedStatement.executeBatch();
			if(aa.length>0)
			{
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.print("<h3><font color='green'>ThisOrder Is placed Successfully</font></h3><br> <a href='index.jsp'>Click here to Go Back</a>");
			}
			else
			{
				System.out.println("no");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}