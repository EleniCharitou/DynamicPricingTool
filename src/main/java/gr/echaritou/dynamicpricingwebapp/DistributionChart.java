package gr.echaritou.dynamicpricingwebapp;

import java.util.List;

public class DistributionChart {

    private List<Double> inputValues;
    private double mean;
    private double standardDeviation;


    public DistributionChart() {
    }

    public DistributionChart(List<Double> inputValues, double mean, double standardDeviation) {
        this.inputValues = inputValues;
        this.mean = mean;
        this.standardDeviation = standardDeviation;
    }

    public List<Double> getInputValues() {
        return inputValues;
    }

    public void setInputValues(List<Double> inputValues) {
        this.inputValues = inputValues;
    }

    public double getMean() {
        return mean;
    }

    public void setMean(double mean) {
        this.mean = mean;
    }

    public double getStandardDeviation() {
        return standardDeviation;
    }

    public void setStandardDeviation(double standardDeviation) {
        this.standardDeviation = standardDeviation;
    }
}
