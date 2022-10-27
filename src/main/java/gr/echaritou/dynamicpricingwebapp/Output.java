package gr.echaritou.dynamicpricingwebapp;

public class Output {

    private String outputString;

    public Output(String outputString) {
        this.outputString = outputString;
    }

    public String getOutputString() {
        return outputString;
    }

    public void setOutputString(String outputString) {
        this.outputString = outputString;
    }

/*    public void gaussianDistribution(){
        // initialization of variables
        double Z, X, s, u;
        X = 26;
        u = 50;
        s = 10;

        // master formula
        Z = (X - u) / s;

        // print the z-value
        System.out.println("the Z-value obtained is: " + Z);
    };*/
}
