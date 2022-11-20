package gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


public class Order {

    private String orderId;
    private String datePurchasedString;
    private LocalDateTime datePurchasedDateFormat;
    private String customerId;
    private double orderTotal;
    private List<String> productIds = new ArrayList<String>();

    private LocalDateTime timeStartView;
    private LocalDateTime timeEndView;
    private double timeSpent = 0;
    private int pageViews = 0;


    //Constuctors
    Order() {
    }

    Order(String orderId, String datePurchasedString, String customerId, double orderTotal, String productId) {
        this.orderId = orderId;
        this.datePurchasedString = datePurchasedString;
        this.customerId = customerId;
        this.orderTotal = orderTotal;
        productIds.add(productId);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        this.datePurchasedDateFormat = LocalDateTime.parse(datePurchasedString, formatter);

        this.timeSpent = Math.random();
        this.pageViews = (int) (Math.random() * 10);
    }

    Order(String orderId, String datePurchasedString, String customerId, double orderTotal, String productId, double timeSpent, int pageViews) {
        this.orderId = orderId;
        this.datePurchasedString = datePurchasedString;
        this.customerId = customerId;
        this.orderTotal = orderTotal;
        productIds.add(productId);
        this.timeSpent = timeSpent;
        this.pageViews = pageViews;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        this.datePurchasedDateFormat = LocalDateTime.parse(datePurchasedString, formatter);
    }


    // Getters
    public String getOrderId() {
        return orderId;
    }

    // Setters
    public void setOrderId(String newOrderId) {
        this.orderId = newOrderId;
    }

    public String getDatePurchasedString() {
        return datePurchasedString;
    }

    public void setDatePurchasedString(String newDatePurchasedString) {
        this.datePurchasedString = newDatePurchasedString;
    }

    public LocalDateTime getDatePurchasedDateFormat() {
        return datePurchasedDateFormat;
    }

    public void setDatePurchasedDateFormat(String newDatePurchasedString) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        this.datePurchasedDateFormat = LocalDateTime.parse(datePurchasedString, formatter);
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String newCustomerId) {
        this.customerId = newCustomerId;
    }

    public double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(double newOrderTotal) {
        this.orderTotal = newOrderTotal;
    }

    public List<String> getProductIds() {
        return productIds;
    }

    public void setProductIds(List<String> newProductIds) {
        this.productIds = newProductIds;
    }

    public int getPageViews() {
        return pageViews;
    }

    public void setPageViews(int newPageViews) {
        this.pageViews = newPageViews;
    }

    public double getTimeSpent() {
        return timeSpent;
    }

    public void setTimeSpent(double newTimeSpent) {
        this.timeSpent = newTimeSpent;
    }


    public void addProduct(String productId) {
        productIds.add(productId);
    }

    public void addPageView() {
        pageViews++;
    }


    public void handleTimeSpent(LocalDateTime timestamp) {
        //case: first timestamp for this order
        if (timeStartView == null && timeEndView == null) {
            timeStartView = timestamp;
            timeEndView = timestamp;
        }
        //case: timestamp belonging to an earlier or later session
        //if inactive for 30 minutes then session is lost, create new session
        else if (timestamp.plusMinutes(30).isBefore(timeStartView) || timestamp.minusMinutes(30).isAfter(timeEndView)) {
            //start new session
            timeSpent = timeSpent + (Duration.between(timeStartView, timeEndView).toMillis()) / 1000;  //calculate in seconds
            timeStartView = timestamp;
            timeEndView = timestamp;
        }
        //case: timestamp before startView, but inside session
        else if (timestamp.isBefore(timeStartView)) {
            timeStartView = timestamp;
        }
        //case: timestamp after endView, but inside session
        else if (timestamp.isAfter(timeEndView)) {
            timeEndView = timestamp;
        }
    }


    public void calculateTimeSpent() {
        if (timeStartView != null && timeEndView != null) {
            timeSpent = timeSpent + (Duration.between(timeStartView, timeEndView).toMillis()) / 1000; //calculate in seconds
        }
    }
}