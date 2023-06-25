package gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression;

import gr.echaritou.dynamicpricingwebapp.input.ShopInput;
import org.deeplearning4j.eval.RegressionEvaluation;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.*;

public class DynamicPricing {

    public static RegressionEvaluation[] run(String numberOfCustomers,
                                             String meanOfCustomers,
                                             String standardDeviationOfCustomers,
                                             String dataProducts,
                                             String dataOrders,
                                             String dataView,
                                             List<ShopInput> shopInputList,
                                             String NN1InputNodes,
                                             String NN1HiddenNodes,
                                             String NN1OutputNodes,
                                             String dataTrainingPercentage,
                                             String seed1,
                                             String nEpochs1,
                                             String nSamples1,
                                             String batchSize1,
                                             String learningRate1,
                                             String NN2InputNodes,
                                             String NN2HiddenNodes,
                                             String NN2OutputNodes,
                                             String seed2,
                                             String nEpochs2,
                                             String nSamples2,
                                             String batchSize2,
                                             String learningRate2) throws IOException, InterruptedException, SQLException {

        String[] productArray = dataProducts.split("\\r?\\n");
        String[] orderArray = dataOrders.split("\\r?\\n");
        String[] viewArray = dataView.split("\\r?\\n");

        //marketplace	parameters
        int numbOfCustomers = Integer.parseInt(numberOfCustomers);
        float meanofCustomers = Float.parseFloat(meanOfCustomers);
        double stdevOfCustomers = Double.parseDouble(standardDeviationOfCustomers);
        int numberOfShops = shopInputList.size();
        int numberOfProducts = productArray.length;


        System.out.println("simulationMarketplace");
        //create	marketplace
        Marketplace simulationMarketplace = new Marketplace(numberOfShops, numberOfProducts, numbOfCustomers);
        //create	shops
        simulationMarketplace.createShops(shopInputList);
        //create products for every shop
        for (int k = 0; k < numberOfShops; k++) {
//            String[] poductsOfEachShop =
            simulationMarketplace.getShopList().get(k).createProducts(productArray);    //products for each shop creation
            //here I will call my calculations 5.7

        }
        //export data for NN1 in csv format
        simulationMarketplace.exportNN1DataCSV();
        simulationMarketplace.dataNormaliserCSV(10, 1);


        //Note: choose one of the following choices


        //Case 1:
        // #TODO this works only for first NN (NN1)
        //create random customers with random wtp (products already created)
        simulationMarketplace.createCustomers(numbOfCustomers, meanofCustomers, stdevOfCustomers);


        //Case 2:
        // #TODO this works for both NNs (NN1 and NN2)
        //create customers with personal profiles, taking into account orders from orders file
        simulationMarketplace.readOrders(orderArray);
        //read views and combine them with order information
        // #TODO this csv is missing
        simulationMarketplace.readViews(viewArray);
//        simulationMarketplace.shopsComparison();

        Random rp = new Random();
        double[][] shopsComparison = new double[10][8];
        double x = 0.15;        //sudelesths leitourgikwn e3odwn
        for (int i = 0; i < 200; i++) {

            ArrayList<Integer> pseudorandomProductNumber = new ArrayList<>();
            for (int j = 0; j < 12883; j++) pseudorandomProductNumber.add(j);
            Collections.shuffle(pseudorandomProductNumber);

            for (Integer productNumber : pseudorandomProductNumber) {
                double customerWtpProductPrice = simulationMarketplace.getCustomerList().get(i).getWtpArray()[productNumber];

                ArrayList<Integer> pseudorandomShopNumber = new ArrayList<>();
                for (int j = 0; j < 10; j++) pseudorandomShopNumber.add(j);
                Collections.shuffle(pseudorandomShopNumber);

                for (Integer shopNumber : pseudorandomShopNumber) {
                    shopsComparison[shopNumber][0]++;                   // number of visits
                    double shopProductPrice = simulationMarketplace.getShopList().get(shopNumber).getProductList().get(productNumber).getPrice();
//                    System.out.println("For customer " + i + ", shop " + shopNumber + " and product " + productNumber + ":");
//                    System.out.println("    wtp price: " + customerWtpProductPrice + " and shop's price: " + shopProductPrice);
                    //topothetisi productId pou agoarastike se ena apo ta shop,ean wtp <= prriceOfShop
                    if (customerWtpProductPrice >= shopProductPrice) {
//                        System.out.println("WTP FOUND!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                        shopsComparison[shopNumber][1]++;               //number of sales
                        shopsComparison[shopNumber][2] = Math.round(((shopsComparison[shopNumber][1] * 100) / shopsComparison[shopNumber][0]) * 100) / 100;      //conversionPercentage-pososto metatropwn
                        shopsComparison[shopNumber][3] = Math.round((shopsComparison[shopNumber][3] + shopProductPrice) * 100.0) / 100.0;                      //a3ia twn sales
                        shopsComparison[shopNumber][6] = Math.round((shopsComparison[shopNumber][6] + simulationMarketplace.getShopList().get(shopNumber).getProductList().get(productNumber).getBaseCost()) * 100) / 100;          //a3ia twn product-baseCost of sales
                        shopsComparison[shopNumber][4] = Math.round((shopsComparison[shopNumber][3] - shopsComparison[shopNumber][6]) * 100) / 100;       //mikta kerdh = a3ia sales - a3ia product
                        shopsComparison[shopNumber][7] = Math.round((shopsComparison[shopNumber][6] * x) * 100) / 100;                                    //leitourgika e3oda
                        shopsComparison[shopNumber][5] = Math.round((shopsComparison[shopNumber][4] - shopsComparison[shopNumber][7]) * 100) / 100;       // kathara kerdh
                    } else {
                        break;
                    }
                }
            }

        }
//store shopsComparison in a .csv
        try {
            PrintWriter shopsComp = new PrintWriter((new File("shopsComparison.csv")));
            //for every shop
            for (double[] doubles : shopsComparison) {
                shopsComp.append(Arrays.toString(doubles).replace("[", "").replace("]", ""));
                shopsComp.append("\n");
            }
            shopsComp.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        //Case 3:
        // #TODO this should works for both NNs (NN1 and NN2) but csv missing
        //create customers with personal profiles, reading orders and views all-together
        // #TODO this csv is missing
        simulationMarketplace.readOrderViews();


        // #TODO 2 NN call are made here, lots of unused methods and variables

        System.out.println("NN1");

        //Create the NN1
//        int NN1numberOfInputNodes = 9;
//        int NN1numberOfHiddenNodes = 6;
//        int NN1numberOfOutputNodes = 1;

        int NN1numberOfInputNodes = Integer.parseInt(NN1InputNodes);
        int NN1numberOfHiddenNodes = Integer.parseInt(NN1HiddenNodes);
        int NN1numberOfOutputNodes = Integer.parseInt(NN1OutputNodes);
        int NN1numberOfSeeds = Integer.parseInt(seed1);
        int NN1numberOfnEpochs = Integer.parseInt(nEpochs1);
        int NN1numberOfnSamples = Integer.parseInt(nSamples1);
        int NN1numberOfBatchSizes = Integer.parseInt(batchSize1);
        double NN1numberOfLearningRate1 = Double.parseDouble(learningRate1);
        double trainingPercent = Double.parseDouble(dataTrainingPercentage);


        NeuralNetwork neuralNetwork1 = new NeuralNetwork(NN1numberOfInputNodes, NN1numberOfHiddenNodes, NN1numberOfOutputNodes, trainingPercent, NN1numberOfSeeds, NN1numberOfnEpochs, NN1numberOfnSamples, NN1numberOfBatchSizes, NN1numberOfLearningRate1);
        neuralNetwork1.setWeights(NN1numberOfInputNodes, NN1numberOfHiddenNodes);
        neuralNetwork1.setWeights(NN1numberOfHiddenNodes, NN1numberOfOutputNodes);
        RegressionEvaluation regressionEvaluation1 = neuralNetwork1.trainAndEvaluateNN1();

        simulationMarketplace.setNeuralPrices();

        //export data for NN2 in csv format, now that neural prices are set
        simulationMarketplace.exportNN2DataCSV();
        simulationMarketplace.dataNormaliserCSV(7, 2);

        System.out.println("NN2");
        simulationMarketplace.rangesForPies();

        //Create the NN2
//        int NN2numberOfInputNodes = 6;
//        int NN2numberOfHiddenNodes = 6;
//        int NN2numberOfOutputNodes = 1;
        int NN2numberOfInputNodes = Integer.parseInt(NN2InputNodes);
        int NN2numberOfHiddenNodes = Integer.parseInt(NN2HiddenNodes);
        int NN2numberOfOutputNodes = Integer.parseInt(NN2OutputNodes);
        int NN2numberOfSeeds = Integer.parseInt(seed2);
        int NN2numberOfnEpochs = Integer.parseInt(nEpochs2);
        int NN2numberOfnSamples = Integer.parseInt(nSamples2);
        int NN2numberOfBatchSizes = Integer.parseInt(batchSize2);
        double NN2numberOfLearningRate1 = Double.parseDouble(learningRate2);


        NeuralNetwork neuralNetwork2 = new NeuralNetwork(NN2numberOfInputNodes, NN2numberOfHiddenNodes, NN2numberOfOutputNodes, trainingPercent, NN2numberOfSeeds, NN2numberOfnEpochs, NN2numberOfnSamples, NN2numberOfBatchSizes, NN2numberOfLearningRate1);
        neuralNetwork2.setWeights(NN2numberOfInputNodes, NN2numberOfHiddenNodes);
        neuralNetwork2.setWeights(NN2numberOfInputNodes, NN2numberOfOutputNodes);
        RegressionEvaluation regressionEvaluation2 = neuralNetwork2.trainAndEvaluateNN2();
        //here Shops Comparison

        return new RegressionEvaluation[]{regressionEvaluation1, regressionEvaluation2};


        // #TODO
        // 1) fix reading and writing csv
        // 2) clean code unused methods and variables
        // 3) create the missing csv (check the code that read the csv to find the columns)
        // 4) more debug/test to confirm the correctness of the result (good luck :P )
    }
}
