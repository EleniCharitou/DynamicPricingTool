package gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression;

import org.datavec.api.records.reader.RecordReader;
import org.datavec.api.records.reader.impl.csv.CSVRecordReader;
import org.datavec.api.split.FileSplit;
import org.deeplearning4j.datasets.datavec.RecordReaderDataSetIterator;
import org.deeplearning4j.eval.RegressionEvaluation;
import org.deeplearning4j.nn.conf.MultiLayerConfiguration;
import org.deeplearning4j.nn.conf.NeuralNetConfiguration;
import org.deeplearning4j.nn.conf.layers.DenseLayer;
import org.deeplearning4j.nn.conf.layers.OutputLayer;
import org.deeplearning4j.nn.multilayer.MultiLayerNetwork;
import org.deeplearning4j.nn.weights.WeightInit;
import org.deeplearning4j.optimize.listeners.ScoreIterationListener;
import org.nd4j.linalg.activations.Activation;
import org.nd4j.linalg.api.ndarray.INDArray;
import org.nd4j.linalg.dataset.api.iterator.DataSetIterator;
import org.nd4j.linalg.factory.Nd4j;
import org.nd4j.linalg.learning.config.Nesterovs;
import org.nd4j.linalg.lossfunctions.LossFunctions;

import java.io.*;
import java.util.Arrays;
import java.util.Random;

public class NeuralNetwork {

    //Random number generator seed, for reproducibility
    public static final int seed = 1234;
    //Number of epochs (full passes of the data)
    public static final int nEpochs = 1; // #TODO this was 20000, takes for ever
    //Number of data points
    public static final int nSamples = 1000;
    //Batch size: i.e., each epoch has nSamples/batchSize parameter updates
    public static final int batchSize = 1000;
    //Network learning rate
    public static final double learningRate = 0.00000001;
    public static final Random rng = new Random(seed);
    private int numberOfInputNodes;
    private int numberOfHiddenNodes;
    private int numberOfOutputNodes;
    private int numberOfSeeds;

    private int numberOfnEpochs;
    private int numberOfnSamples;
    private int numberOfBatchSizes;

    private double numberOfLearningRate;

    //Constructor
    NeuralNetwork(int numberOfInputNodes, int numberOfHiddenNodes, int numberOfOutputNodes, int numberOfSeeds, int numberOfnEpochs, int numberOfnSamples, int numberOfBatchSizes, double numberOfLearningRate) {
        this.numberOfInputNodes = numberOfInputNodes;
        this.numberOfHiddenNodes = numberOfHiddenNodes;
        this.numberOfOutputNodes = numberOfOutputNodes;
        this.numberOfSeeds = numberOfSeeds;
        this.numberOfnEpochs = numberOfnEpochs;
        this.numberOfnSamples = numberOfnSamples;
        this.numberOfBatchSizes = numberOfBatchSizes;
        this.numberOfLearningRate = numberOfLearningRate;
    }

    // Getters
    public int getNumberOfInputNodes() {
        return numberOfInputNodes;
    }

    // Setters
    public void setNumberOfInputNodes(int newNumberOfInputNodes) {
        this.numberOfInputNodes = newNumberOfInputNodes;
    }

    public int getNumberOfHiddenNodes() {
        return numberOfHiddenNodes;
    }

    public void setNumberOfHiddenNodes(int newNumberOfHiddenNodes) {
        this.numberOfHiddenNodes = newNumberOfHiddenNodes;
    }

    public int getNumberOfOutputNodes() {
        return numberOfOutputNodes;
    }
    // The range of the sample data, data in range (0-1 is sensitive for NN, you can try other ranges and see how it effects the results
    // also try changing the range along with changing the activation function

    public void setNumberOfOutputNodes(int newNumberOfOutputNodes) {
        this.numberOfOutputNodes = newNumberOfOutputNodes;
    }

    public int getNumberOfSeeds() {
        return numberOfSeeds;
    }

    public void setNumberOfSeeds(int numberOfSeeds) {
        this.numberOfSeeds = numberOfSeeds;
    }

    public int getNumberOfnEpochs() {
        return numberOfnEpochs;
    }

    public void setNumberOfnEpochs(int numberOfnEpochs) {
        this.numberOfnEpochs = numberOfnEpochs;
    }

    public int getNumberOfnSamples() {
        return numberOfnSamples;
    }

    public void setNumberOfnSamples(int numberOfnSamples) {
        this.numberOfnSamples = numberOfnSamples;
    }

    public int getNumberOfBatchSizes() {
        return numberOfBatchSizes;
    }

    public void setNumberOfBatchSizes(int numberOfBatchSizes) {
        this.numberOfBatchSizes = numberOfBatchSizes;
    }

    public double getNumberOfLearningRate() {
        return numberOfLearningRate;
    }

    public void setNumberOfLearningRate(double numberOfLearningRate) {
        this.numberOfLearningRate = numberOfLearningRate;
    }

    public RegressionEvaluation trainAndEvaluateNN1() throws IOException, InterruptedException {

        //Load the training data:
        RecordReader rr = new CSVRecordReader();
        rr.initialize(new FileSplit(new File("inputNormalised_NN1.csv")));

        // Main constructor for multi-label regression (i.e., regression with multiple outputs).
        // Can also be used for single output regression with labelIndexFrom == labelIndexTo
        //@param recordReader      RecordReader to get data from
        //@param labelIndexFrom    Index of the first regression target
        //@param labelIndexTo      Index of the last regression target, inclusive
        //@param batchSize         Mini-batch size
        //@param regression        Require regression = true. Mainly included to avoid clashing with other constructors previously defined :/
        DataSetIterator iterator = new RecordReaderDataSetIterator(rr, numberOfBatchSizes, 1, 1, true);
        System.out.println("Reader NN1 normalised : " + rr);


        //Load the test/evaluation data:
        RecordReader rrTest = new CSVRecordReader();
        rrTest.initialize(new FileSplit(new File("inputNormalised_NN1.csv"))); //experimentData1
        DataSetIterator testIter = new RecordReaderDataSetIterator(rrTest, numberOfBatchSizes, 1, 1, true);

        //build the neural network
        //MultiLayerNetwork net = new MultiLayerNetwork(new NeuralNetConfiguration.Builder()
        MultiLayerConfiguration conf = new NeuralNetConfiguration.Builder()
                .seed(numberOfSeeds)
                .updater(new Nesterovs(numberOfLearningRate, 0.9))
                .list()
                .layer(0, new DenseLayer.Builder().nIn(numberOfInputNodes).nOut(numberOfHiddenNodes)
                        .weightInit(WeightInit.XAVIER)
                        .activation(Activation.RELU)  //RELU  /TANH //RELU
                        .build())
                //add hiddelayer
                .layer(1, new OutputLayer.Builder(LossFunctions.LossFunction.MSE)    //MSE //NEGATIVELOGLIKELIHOOD
                        .weightInit(WeightInit.XAVIER)
                        .activation(Activation.LEAKYRELU)   //LEAKYRELU     //IDENTITY //SOFTMAX
                        .nIn(numberOfHiddenNodes).nOut(numberOfOutputNodes).build())
                .pretrain(false).backprop(true).build();
        MultiLayerNetwork model = new MultiLayerNetwork(conf);
        model.init();
        model.setListeners(new ScoreIterationListener(1));  //Print score every 10 parameter updates

        //set weights of input layer
        double[] weightsLayer0 = setWeights(numberOfInputNodes, numberOfHiddenNodes);
        INDArray paramsLayer0 = Nd4j.create(weightsLayer0);
        model.getLayer(0).setParams(paramsLayer0);

        //set weights of hidden layer
        double[] weightsLayer1 = setWeights(numberOfHiddenNodes, numberOfOutputNodes);
        INDArray paramsLayer1 = Nd4j.create(weightsLayer1);
        model.getLayer(1).setParams(paramsLayer1);

        //Train the network on the full data set, and evaluate it periodically
        for (int n = 0; n < numberOfnEpochs; n++) {
            System.out.println("Epoch " + n);
            model.fit(iterator);
        }

        //Statistics of regression evaluation
        RegressionEvaluation eval = model.evaluateRegression(testIter);
        System.out.println(eval.stats());
//        RegressionEvaluation eval =  new RegressionEvaluation(1);

        //System.out.println(model.getLayer(0).getParam("W"));
        //System.out.println(model.getLayer(1).getParam("W"));


        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";

        try {
            PrintWriter pw1 = new PrintWriter(new File("outputDataNN1.csv"));

            try {
                br = new BufferedReader(new FileReader("inputNormalised_NN1.csv"));
                while ((line = br.readLine()) != null) {

                    //use comma as separator
                    String[] productdetailsstring = line.split(cvsSplitBy);
                    //convert string to double
                    double[] productdetails = Arrays.stream(productdetailsstring).mapToDouble(Double::parseDouble).toArray();

                    INDArray input = Nd4j.create(new double[]{productdetails[0], productdetails[1], productdetails[2], productdetails[3], productdetails[4], productdetails[5], productdetails[6], productdetails[7], productdetails[8]}, new int[]{1, 9});
                    INDArray out = model.output(input, false);

                    double outputPriceNN = out.getDouble(0, 0);
                    double outputPriceNNAfterCorrection = outputPriceNN;

                    double productCost = productdetails[0];
                    //correct extreme price values
                    if (outputPriceNN <= productCost) {
                        outputPriceNNAfterCorrection = 1.2 * productCost;
                    }
                    if (outputPriceNN > 2 * productCost) {
                        outputPriceNNAfterCorrection = 2 * productCost;
                    }

                    double errorBeforeCorrection = Math.abs(outputPriceNN - productdetails[9]);
                    double squareErrorBeforeCorrection = Math.abs(outputPriceNN - productdetails[9]) * Math.abs(outputPriceNN - productdetails[9]);
                    double errorAfterCorrection = Math.abs(outputPriceNNAfterCorrection - productdetails[9]);
                    double squareErrorAfterCorrection = Math.abs(outputPriceNNAfterCorrection - productdetails[9]) * Math.abs(outputPriceNNAfterCorrection - productdetails[9]);

                    StringBuilder sb = new StringBuilder();
                    pw1.write(sb.toString());
                    sb.append(outputPriceNN);
                    sb.append(',');
                    sb.append(errorBeforeCorrection);
                    sb.append(',');
                    sb.append(squareErrorBeforeCorrection);
                    sb.append(',');
                    sb.append(outputPriceNNAfterCorrection);
                    sb.append(',');
                    sb.append(errorAfterCorrection);
                    sb.append(',');
                    sb.append(squareErrorAfterCorrection);
                    sb.append('\n');
                    pw1.write(sb.toString());
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (br != null) {
                    try {
                        br.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            pw1.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return eval;
    }


    public RegressionEvaluation trainAndEvaluateNN2() throws IOException, InterruptedException {

        //Load the training data:
        RecordReader rr = new CSVRecordReader();
        rr.initialize(new FileSplit(new File("inputNormalised_NN2.csv")));
        DataSetIterator iterator = new RecordReaderDataSetIterator(rr, numberOfBatchSizes, 1, 1, true);

        //Load the test/evaluation data:
        RecordReader rrTest = new CSVRecordReader();
        rrTest.initialize(new FileSplit(new File("inputNormalised_NN2.csv"))); //experimentData1
        DataSetIterator testIter = new RecordReaderDataSetIterator(rrTest, numberOfBatchSizes, 1, 1, true);

//        numberOfInputNodes = 6;
//        numberOfHiddenNodes = 6;

        //build the neural network
        MultiLayerConfiguration conf = new NeuralNetConfiguration.Builder()
                .seed(numberOfSeeds)
                .updater(new Nesterovs(numberOfLearningRate, 0.9))
                .list()
                .layer(0, new DenseLayer.Builder().nIn(numberOfInputNodes).nOut(numberOfHiddenNodes)
                        .weightInit(WeightInit.XAVIER)
                        .activation(Activation.RELU)  //RELU  /TANH //RELU
                        .build())
                //add hiddelayer
                .layer(1, new OutputLayer.Builder(LossFunctions.LossFunction.MSE)    //MSE //NEGATIVELOGLIKELIHOOD
                        .weightInit(WeightInit.XAVIER)
                        .activation(Activation.LEAKYRELU)   //LEAKYRELU     //IDENTITY //SOFTMAX
                        .nIn(numberOfHiddenNodes).nOut(numberOfOutputNodes).build())
                .pretrain(false).backprop(true).build();
        MultiLayerNetwork model = new MultiLayerNetwork(conf);
        model.init();
        model.setListeners(new ScoreIterationListener(10));  //Print score every 10 parameter updates

        //Train the network on the full data set, and evaluate in periodically
        for (int n = 0; n < numberOfnEpochs; n++) {
            System.out.println("Epoch " + n);
            model.fit(iterator);
        }

        //Statistics of regression evaluation
        RegressionEvaluation eval = model.evaluateRegression(testIter);
        System.out.println(eval.stats());


        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
        int counter = 0;

        try {
            PrintWriter pw1 = new PrintWriter(new File("outputDataNN2.csv"));

            try {
                br = new BufferedReader(new FileReader("inputNormalised_NN2.csv"));
                while ((line = br.readLine()) != null) {

                    // use comma as separator
                    String[] customerdetailsstring = line.split(cvsSplitBy);
                    //convert string to double
                    double[] productdetails = Arrays.stream(customerdetailsstring).mapToDouble(Double::parseDouble).toArray();

                    INDArray input = Nd4j.create(new double[]{productdetails[0], productdetails[1], productdetails[2], productdetails[3], productdetails[4], productdetails[5]}, new int[]{1, 6});
                    INDArray out = model.output(input, false);

                    double outputPriceNN = out.getDouble(0, 0);
                    double outputPriceNNAfterCorrection = outputPriceNN;

                    double nn1Price = productdetails[0];
                    //correct extreme price values
                    if (outputPriceNN <= 0.4 * nn1Price) {
                        outputPriceNNAfterCorrection = nn1Price;
                    }
                    if (outputPriceNN > 2 * nn1Price) {
                        outputPriceNNAfterCorrection = 2 * nn1Price;
                    }

                    double errorBeforeCorrection = Math.abs(outputPriceNN - productdetails[6]);
                    double squareErrorBeforeCorrection = Math.abs(outputPriceNN - productdetails[6]) * Math.abs(outputPriceNN - productdetails[6]);
                    double errorAfterCorrection = Math.abs(outputPriceNNAfterCorrection - productdetails[6]);
                    double squareErrorAfterCorrection = Math.abs(outputPriceNNAfterCorrection - productdetails[6]) * Math.abs(outputPriceNNAfterCorrection - productdetails[6]);

                    StringBuilder sb = new StringBuilder();
                    pw1.write(sb.toString());
                    sb.append(outputPriceNN);
                    sb.append(',');
                    sb.append(errorBeforeCorrection);
                    sb.append(',');
                    sb.append(squareErrorBeforeCorrection);
                    sb.append(',');
                    sb.append(outputPriceNNAfterCorrection);
                    sb.append(',');
                    sb.append(errorAfterCorrection);
                    sb.append(',');
                    sb.append(squareErrorAfterCorrection);
                    sb.append('\n');
                    pw1.write(sb.toString());

                    counter++;
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (br != null) {
                    try {
                        br.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            pw1.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return eval;
    }


    public double[] setWeights(int numberLayerInputs, int numberLayerOutputs) {

        double[] weightsArray = new double[(numberLayerInputs + 1) * numberLayerOutputs];
        int counter = 0;

        while (counter < ((numberLayerInputs + 1) * numberLayerOutputs)) {
            if ((counter % numberLayerInputs) == 0 && counter != numberLayerInputs * numberLayerOutputs) {
                weightsArray[counter] = 1;
            } else {
                weightsArray[counter] = 1.0 / (numberLayerInputs - 1);
            }
            counter++;
        }
        System.out.println("Weights: OK");
        return weightsArray;
    }
}
