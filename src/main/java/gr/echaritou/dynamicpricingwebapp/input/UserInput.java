package gr.echaritou.dynamicpricingwebapp.input;

import java.util.List;

public class UserInput {

    private String numberOfCustomers;
    private String meanOfCustomers;
    private String standardDeviationOfCustomers;
    private String dataProducts;

    private String dataOrders;

    private String dataViews;

    private String inputNodesNN1;
    private String hiddenNodesNN1;
    private String outputNodesNN1;

    private String inputNodesNN2;

    private String hiddenNodesNN2;

    private String outputNodesNN2;
    private List<ShopInput> dataShops;

    public String getNumberOfCustomers() {
        return numberOfCustomers;
    }

    public void setNumberOfCustomers(String numberOfCustomers) {
        this.numberOfCustomers = numberOfCustomers;
    }

    public String getMeanOfCustomers() {
        return meanOfCustomers;
    }

    public void setMeanOfCustomers(String meanOfCustomers) {
        this.meanOfCustomers = meanOfCustomers;
    }

    public String getStandardDeviationOfCustomers() {
        return standardDeviationOfCustomers;
    }

    public void setStandardDeviationOfCustomers(String standardDeviationOfCustomers) {
        this.standardDeviationOfCustomers = standardDeviationOfCustomers;
    }

    public String getDataProducts() {
        return dataProducts;
    }

    public void setDataProducts(String dataProducts) {
        this.dataProducts = dataProducts;
    }

    public String getDataOrders() {
        return dataOrders;
    }

    public void setDataOrders(String dataOrders) {
        this.dataOrders = dataOrders;
    }

    public String getDataViews() {
        return dataViews;
    }

    public void setDataViews(String dataViews) {
        this.dataViews = dataViews;
    }

    public List<ShopInput> getDataShops() {
        return dataShops;
    }

    public String getInputNodesNN1() {
        return inputNodesNN1;
    }

    public void setInputNodesNN1(String inputNodesNN1) {
        this.inputNodesNN1 = inputNodesNN1;
    }

    public String getHiddenNodesNN1() {
        return hiddenNodesNN1;
    }

    public void setHiddenNodesNN1(String hiddenNodesNN1) {
        this.hiddenNodesNN1 = hiddenNodesNN1;
    }

    public String getOutputNodesNN1() {
        return outputNodesNN1;
    }

    public void setOutputNodesNN1(String outputNodesNN1) {
        this.outputNodesNN1 = outputNodesNN1;
    }

    public String getInputNodesNN2() {
        return inputNodesNN2;
    }

    public void setInputNodesNN2(String inputNodesNN2) {
        this.inputNodesNN2 = inputNodesNN2;
    }

    public String getHiddenNodesNN2() {
        return hiddenNodesNN2;
    }

    public void setHiddenNodesNN2(String hiddenNodesNN2) {
        this.hiddenNodesNN2 = hiddenNodesNN2;
    }

    public String getOutputNodesNN2() {
        return outputNodesNN2;
    }

    public void setOutputNodesNN2(String outputNodesNN2) {
        this.outputNodesNN2 = outputNodesNN2;
    }

    public void setDataShops(List<ShopInput> dataShops) {
        this.dataShops = dataShops;
    }
}
