package gr.echaritou.dynamicpricingwebapp.controllers;

import gr.echaritou.dynamicpricingwebapp.Input;
import gr.echaritou.dynamicpricingwebapp.Output;
import org.apache.commons.io.IOUtils;
import org.springframework.http.InvalidMediaTypeException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
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

    @PostMapping( path = "/postFile")
    @ResponseBody
    public String getFile(String fileTest) throws IOException {

        System.out.println(fileTest);

        List<String> items = Arrays.asList(fileTest.split("\\s*\r\n\\s*"));

        List<Integer> intItems = new ArrayList<>();

        for(String s : items) intItems.add(Integer.valueOf(s));

        int length = intItems.size();

        double sum = 0.0;
        double variance  = 0.0;

        for(double num : intItems) {
            sum += num;
        }

        double mean = sum/length;

        for(double num: intItems) {
            variance  += Math.pow(num - mean, 2);
        }

        variance /= length;

        double standardDeviation = Math.sqrt(variance);

        return String.valueOf(standardDeviation);
    }


}
