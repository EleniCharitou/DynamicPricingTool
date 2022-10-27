package gr.echaritou.dynamicpricingwebapp.controllers;

import gr.echaritou.dynamicpricingwebapp.Input;
import gr.echaritou.dynamicpricingwebapp.Output;
import org.springframework.http.InvalidMediaTypeException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

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

}
