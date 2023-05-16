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
        String sql = "CREATE TABLE IF NOT EXISTS history (\n"
                + " id integer PRIMARY KEY,\n"
                + " data_products text NOT NULL,\n"
                + " data_orders text NOT NULL,\n"
                + " data_views text NOT NULL,\n"
                + " input_NN2 text NOT NULL,\n"
                + " input_fields text NOT NULL,\n"
                + " result text NOT NULL,\n"
                + " timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,\n"
                + " run_time text NOT NULL\n"
                + ");";

        try {
            // db parameters
            String url = "jdbc:sqlite:history.db";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            System.out.println("Connection to SQLite has been established.");

            Statement stmt = conn.createStatement();
            stmt.execute(sql);

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
