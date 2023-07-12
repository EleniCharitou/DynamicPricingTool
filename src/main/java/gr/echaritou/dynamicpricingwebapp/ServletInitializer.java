package gr.echaritou.dynamicpricingwebapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.event.EventListener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@SpringBootApplication
public class ServletInitializer extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ServletInitializer.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ServletInitializer.class);
    }

    @EventListener(ApplicationReadyEvent.class)
    public void doSomethingAfterStartup() {

        Connection conn = null;
        String sql1 = "CREATE TABLE IF NOT EXISTS history (\n"
                + " id integer PRIMARY KEY,\n"
                + " data_products text NOT NULL,\n"
                + " data_orders text NOT NULL,\n"
                + " data_views text NOT NULL,\n"
                + " input_fields text NOT NULL,\n"
                + " metrics text NOT NULL,\n"
                + " timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,\n"
                + " run_time text NOT NULL,\n"
                + " training_data text NOT NULL,\n"
                + " testing_data text NOT NULL,\n"
                + " customer_data text NOT NULL,\n"
                + " shops_comparison text NOT NULL,\n"
                + " recency text NOT NULL,\n"
                + " frequency text NOT NULL,\n"
                + " monetary text NOT NULL,\n"
                + " pageViews text NOT NULL,\n"
                + " timeSpent text NOT NULL\n"
                + ");";


        try {
            // db parameters
            String url = "jdbc:sqlite:history.db";
            // create a connection to the database
            conn = DriverManager.getConnection(url);
            System.out.println("Connection to SQLite has been established.");

            Statement stmt = conn.createStatement();
            stmt.execute(sql1);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }


    }

}
