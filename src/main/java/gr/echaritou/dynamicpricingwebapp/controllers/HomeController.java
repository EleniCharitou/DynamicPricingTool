package gr.echaritou.dynamicpricingwebapp.controllers;

import gr.echaritou.dynamicpricingwebapp.*;
import gr.echaritou.dynamicpricingwebapp.input.UserInput;
import gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression.DynamicPricing;
import org.deeplearning4j.eval.RegressionEvaluation;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
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

    @PostMapping( path = "/getData",
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
    public List<String> getUserInput(@RequestBody UserInput userInput) throws IOException, InterruptedException {

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
                userInput.getInputNodesNN2(),
                userInput.getHiddenNodesNN2(),
                userInput.getOutputNodesNN2()
        );

        List<String> stats = new ArrayList<>();

        for (int i = 0; i < regressionEvaluations.length; i++) {
            stats.add(regressionEvaluations[i].stats());
        }

        return stats;
    }


}
