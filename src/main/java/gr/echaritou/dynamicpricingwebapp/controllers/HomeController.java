package gr.echaritou.dynamicpricingwebapp.controllers;

import gr.echaritou.dynamicpricingwebapp.DistributionChart;
import gr.echaritou.dynamicpricingwebapp.Input;
import gr.echaritou.dynamicpricingwebapp.Output;
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

//        Output outputGraph = new Output("The graph is:"  + gaussianDistribution());

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


}
