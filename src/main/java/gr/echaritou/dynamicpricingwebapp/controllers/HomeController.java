package gr.echaritou.dynamicpricingwebapp.controllers;

import gr.echaritou.dynamicpricingwebapp.*;
import gr.echaritou.dynamicpricingwebapp.input.UserInput;
import gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression.DynamicPricing;
import gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression.Marketplace;
import org.deeplearning4j.eval.RegressionEvaluation;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    @GetMapping("/home")
    public String showHomePage() {
        return "home";
    }

    @PostMapping(path = "/getData",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Output getData(@RequestBody Input input) throws IOException {

        if (input != null) {
            Output output = new Output("First value is: " + input.getFirst_value() + " and second value is: " + input.getSecond_value() + ".");
            return output;
        }

        // exception
        return null;
    }

    @PostMapping(path = "/postFile", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public DistributionChart getFile(String fileTest) throws IOException {

        System.out.println(fileTest);

        List<String> items = Arrays.asList(fileTest.split("\\s*\r\n\\s*"));

        List<Double> values = new ArrayList<>();

        for (String s : items) values.add(Double.valueOf(s));

        Collections.sort(values);

        int length = values.size();

        double sum = 0.0;
        double variance = 0.0;

        for (double num : values) {
            sum += num;
        }

        double mean = sum / length;

        for (double num : values) {
            variance += Math.pow(num - mean, 2);
        }

        variance /= length;

        double standardDeviation = Math.sqrt(variance);

        DistributionChart distributionChart = new DistributionChart(values, mean, standardDeviation);

        return distributionChart;
    }

    @GetMapping("/marketplace")
    public String showMarketplace() {
        return "marketplace";
    }

    @PostMapping(path = "/getParams",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)

    @ResponseBody
    public OutputMarketplace getMarketplace(@RequestBody InputMarketplace inputMarket) throws IOException {

        if (inputMarket != null) {
            OutputMarketplace outputMarket = new OutputMarketplace("The number of shops is: " + inputMarket.getNumberOfShops() + " and the number of products is:" + inputMarket.getNumberOfProducts() + " and the number of customers is:" + inputMarket.getNumberOfCustomers());
            return outputMarket;

        }

        return null;
    }

    @PostMapping(path = "/getUserInput",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)

    @ResponseBody
    public List<String> getUserInput(@RequestBody UserInput userInput) throws IOException, InterruptedException, SQLException {

        long startTime = System.currentTimeMillis();

        RegressionEvaluation[] regressionEvaluations = DynamicPricing.run(userInput.getNumberOfCustomers(),
                userInput.getMeanOfCustomers(),
                userInput.getStandardDeviationOfCustomers(),
                userInput.getDataProducts(),
                userInput.getDataOrders(),
                userInput.getDataViews(),
                userInput.getDataShops(),
                userInput.getInputNodesNN1(),
                userInput.getHiddenNodesNN1(),
                userInput.getOutputNodesNN1(),
                userInput.getDataTrainingPercentage(),
                userInput.getSeedsNN1(),
                userInput.getnEpochsNN1(),
                userInput.getnSamplesNN1(),
                userInput.getBatchSizeNN1(),
                userInput.getLearningRateNN1(),
                userInput.getInputNodesNN2(),
                userInput.getHiddenNodesNN2(),
                userInput.getOutputNodesNN2(),
                userInput.getSeedsNN2(),
                userInput.getnEpochsNN2(),
                userInput.getnSamplesNN2(),
                userInput.getBatchSizeNN2(),
                userInput.getLearningRateNN2());

        String inputNN2 = new String(Files.readAllBytes(Paths.get("input_NN2.csv")), StandardCharsets.UTF_8);
        String training_data = new String(Files.readAllBytes(Paths.get("trainingData.csv")), StandardCharsets.UTF_8);
        String testing_data = new String(Files.readAllBytes(Paths.get("testingData.csv")), StandardCharsets.UTF_8);
        String shopsComparison = new String(Files.readAllBytes(Paths.get("shopsComparison.csv")), StandardCharsets.UTF_8);
        String[] customerRanges = Marketplace.rangesForPies();


        long endTime = System.currentTimeMillis();
        long seconds = (endTime - startTime) / 1000;

        List<String> stats = new ArrayList<>();

        for (int i = 0; i < regressionEvaluations.length; i++) {
            stats.add(regressionEvaluations[i].stats().split("\n")[1].replaceAll(" +", " ").trim());
        }

        String sql = "INSERT INTO history(" +
                "data_products," +
                "data_orders," +
                "data_views," +
                "input_fields," +
                "metrics," +
                "run_time," +
                "training_data," +
                "testing_data," +
                "customer_data," +
                "shops_comparison," +
                "recency," +
                "frequency," +
                "monetary," +
                "pageViews," +
                "timeSpent) " +
                "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        JSONObject inputJSON = new JSONObject();

        inputJSON.put("numberOfCustomers", userInput.getNumberOfCustomers());
        inputJSON.put("meanOfCustomers", userInput.getMeanOfCustomers());
        inputJSON.put("standardDeviationOfCustomers", userInput.getStandardDeviationOfCustomers());
        inputJSON.put("dataTrainingPercentage", userInput.getDataTrainingPercentage());
        inputJSON.put("dataShops", userInput.getDataShops());
        inputJSON.put("inputNodesNN1", userInput.getInputNodesNN1());
        inputJSON.put("hiddenNodesNN1", userInput.getHiddenNodesNN1());
        inputJSON.put("outputNodesNN1", userInput.getOutputNodesNN1());
        inputJSON.put("inputNodesNN2", userInput.getInputNodesNN2());
        inputJSON.put("hiddenNodesNN2", userInput.getHiddenNodesNN2());
        inputJSON.put("outputNodesNN2", userInput.getOutputNodesNN2());
        inputJSON.put("seedsNN1", userInput.getSeedsNN1());
        inputJSON.put("nEpochsNN1", userInput.getnEpochsNN1());
        inputJSON.put("nSamplesNN1", userInput.getnSamplesNN1());
        inputJSON.put("batchSizeNN1", userInput.getBatchSizeNN1());
        inputJSON.put("learningRateNN1", userInput.getLearningRateNN1());
        inputJSON.put("seedsNN2", userInput.getSeedsNN2());
        inputJSON.put("nEpochsNN2", userInput.getnEpochsNN2());
        inputJSON.put("nSamplesNN2", userInput.getnSamplesNN2());
        inputJSON.put("batchSizeNN2", userInput.getBatchSizeNN2());
        inputJSON.put("learningRateNN2", userInput.getLearningRateNN2());

        System.out.println(inputJSON);

        try {
            // db parameters
            String url = "jdbc:sqlite:history.db";
            // create a connection to the database
            Connection conn = DriverManager.getConnection(url);
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userInput.getDataProducts());
            pstmt.setString(2, userInput.getDataOrders());
            pstmt.setString(3, userInput.getDataViews());
            pstmt.setString(4, inputJSON.toString());
            pstmt.setString(5, stats.toString().replace("[", "").replace("]", "").trim());
            pstmt.setString(6, String.valueOf(seconds));
            pstmt.setString(7, training_data);
            pstmt.setString(8, testing_data);
            pstmt.setString(9, inputNN2);
            pstmt.setString(10, shopsComparison);
            pstmt.setString(11, customerRanges[0]);
            pstmt.setString(12, customerRanges[1]);
            pstmt.setString(13, customerRanges[2]);
            pstmt.setString(14, customerRanges[3]);
            pstmt.setString(15, customerRanges[4]);
/*
            pstmt.setString(11, customerRanges[0]);
*/

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return stats;
    }

    @GetMapping("/history")
    public String showHistoryPage() {
        return "history";
    }

    @PostMapping(path = "/getHistory",
            consumes = MediaType.APPLICATION_JSON_VALUE)

    @ResponseBody
    public String getHistoryFromDB() {

        String sql = "SELECT * FROM history";

        JSONObject outputJSON = new JSONObject();

        try {
            String url = "jdbc:sqlite:history.db";
            Connection conn = DriverManager.getConnection(url);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            JSONArray arrayJSON = new JSONArray();

            // loop through the result set
            while (rs.next()) {
                JSONObject dbRowJSON = new JSONObject();

                dbRowJSON.put("data_products", rs.getString("data_products"));
                dbRowJSON.put("data_orders", rs.getString("data_orders"));
                dbRowJSON.put("data_views", rs.getString("data_views"));
                dbRowJSON.put("input_fields", rs.getString("input_fields"));
                dbRowJSON.put("metrics", rs.getString("metrics"));
                dbRowJSON.put("timestamp", rs.getTimestamp("timestamp"));
                dbRowJSON.put("run_time", rs.getString("run_time"));
                dbRowJSON.put("training_data", rs.getString("training_data"));
                dbRowJSON.put("testing_data", rs.getString("testing_data"));
                dbRowJSON.put("customer_data", rs.getString("customer_data"));
                dbRowJSON.put("shops_comparison", rs.getString("shops_comparison"));
                dbRowJSON.put("recency", rs.getString("recency"));
                dbRowJSON.put("frequency", rs.getString("frequency"));
                dbRowJSON.put("monetary", rs.getString("monetary"));
                dbRowJSON.put("pageViews", rs.getString("pageViews"));
                dbRowJSON.put("timeSpent", rs.getString("timeSpent"));

                arrayJSON.put(dbRowJSON);

            }


            outputJSON.put("output", arrayJSON);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return outputJSON.toString();

    }
}
