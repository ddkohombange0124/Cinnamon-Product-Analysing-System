import java.awt.Color;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;

@WebServlet("/PieChartServlet")
public class PieChartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String DB_USER = "your_username";
    private static final String DB_PASSWORD = "your_password";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Create a database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Create a statement
            stmt = conn.createStatement();

            // Execute a SQL query to retrieve data from the database
            String sql = "SELECT category, value FROM your_table";
            rs = stmt.executeQuery(sql);

            // Create a dataset for the pie chart
            DefaultPieDataset dataset = new DefaultPieDataset();
            while (rs.next()) {
                String category = rs.getString("category");
                int value = rs.getInt("value");
                dataset.setValue(category, value);
            }

            // Create the pie chart
            JFreeChart chart = ChartFactory.createPieChart("Pie Chart", dataset, true, true, false);

            // Customize the appearance of the chart
            PiePlot plot = (PiePlot) chart.getPlot();
            plot.setSectionPaint("Category 1", Color.RED);
            plot.setSectionPaint("Category 2", Color.GREEN);
            plot.setSectionPaint("Category 3", Color.BLUE);

            // Generate the chart as a PNG image and write it to the response
            response.setContentType("image/png");
            ChartUtilities.writeChartAsPNG(response.getOutputStream(), chart, 500, 300);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
