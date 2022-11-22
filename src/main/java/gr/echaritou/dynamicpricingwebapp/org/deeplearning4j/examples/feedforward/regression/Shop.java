package gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Shop {

    private final List<Product> productList = new ArrayList<Product>();
    //Shop	object	variables
    private double deliveryCost;
    private double deliveryTime;
    private boolean deliveryMethod;
    private boolean paymentMethod;
    private double sellerReviews;
    private double sellerReputation;
    private double averageProfitDifference;


    //Constructor
    Shop(int numberOfProducts, double deliveryCost, double deliveryTime, boolean deliveryMethod, boolean paymentMethod, double sellerReviews, double sellerReputation, double averageProfitDifference) {
        this.deliveryCost = deliveryCost;
        this.deliveryTime = deliveryTime;
        this.deliveryMethod = deliveryMethod;
        this.paymentMethod = paymentMethod;
        this.sellerReviews = sellerReviews;
        this.sellerReputation = sellerReputation;
        this.averageProfitDifference = averageProfitDifference;
    }


    // Getters
    public double getDeliveryCost() {
        return deliveryCost;
    }

    // Setters
    public void setDeliveryCost(double newDeliveryCost) {
        this.deliveryCost = newDeliveryCost;
    }

    public double getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(double newDeliveryTime) {
        this.deliveryTime = newDeliveryTime;
    }

    public boolean getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(boolean newDeliveryMethod) {
        this.deliveryMethod = newDeliveryMethod;
    }

    public boolean getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(boolean newPaymentMethod) {
        this.paymentMethod = newPaymentMethod;
    }

    public double getSellerReviews() {
        return sellerReviews;
    }

    public void setSellerReviews(double newSellerReviews) {
        this.sellerReviews = newSellerReviews;
    }

    public double getSellerReputation() {
        return sellerReputation;
    }

    public void setSellerReputation(double newSellerReputation) {
        this.sellerReputation = newSellerReputation;
    }

    public double getAverageProfitDifference() {
        return averageProfitDifference;
    }

    public void setAverageProfitDifference(double newAverageProfitDifference) {
        this.averageProfitDifference = newAverageProfitDifference;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void createProducts(String[] productArray) {


        for (int i = 0; i < productArray.length; i++) {

            String[] productDetailsString = productArray[i].split(",");

            //create product & set attributes
            Product product = new Product();
            product.setProductId(productDetailsString[0]);
            product.setBaseCost(Double.parseDouble(productDetailsString[1]));
            product.setBrandPower(Double.parseDouble(productDetailsString[2]));
            double referencePrice = Double.parseDouble(productDetailsString[3]);    //local variable
            product.setReferencePrice(referencePrice);

                //calculate price based on profit percentage
                Random r = new Random();
                double price = referencePrice + referencePrice * (2 * this.getAverageProfitDifference() * r.nextDouble());
                product.setPrice(price);

            //estimate relative base cost, relative price -> essential for 2nd nn, experiment with it at first nn
            double relativePrice = (price / referencePrice) * 100;   //or  ( (price - referencePrice)  / referencePrice) *100;
            product.setRelativePrice(relativePrice);

            //set stock, 90% probability available
            float stockProbability = r.nextFloat();

            product.setStockBool(!(stockProbability <= 0.10f));

            productList.add(product);
        }
        System.out.println("Products created");

    }


    public double getNeuralPriceByProductId(String productId) {
        for (int i = 0; i < productList.size(); i++) {
            if (productId.equals(productList.get(i).getProductId())) {
                return productList.get(i).getNN1Price();
            }
        }
        System.out.println("Did not find product with id: " + productId);
        return -1;
    }


    public double getPriceByProductId(String productId) {
        for (int i = 0; i < productList.size(); i++) {
            if (productId.equals(productList.get(i).getProductId())) {
                return productList.get(i).getPrice();
            }
        }
        System.out.println("Did not find product with id: " + productId);
        return -1;
    }
}