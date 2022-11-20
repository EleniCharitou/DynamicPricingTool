package gr.echaritou.dynamicpricingwebapp.input;

import java.util.List;

public class UserInput {

    private String numberOfCustomers;
    private String dataProducts;

    private String dataOrders;

    private String dataViews;

    private List<ShopInput> dataShops;

    public String getNumberOfCustomers() {
        return numberOfCustomers;
    }

    public void setNumberOfCustomers(String numberOfCustomers) {
        this.numberOfCustomers = numberOfCustomers;
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

    public void setDataShops(List<ShopInput> dataShops) {
        this.dataShops = dataShops;
    }
}
