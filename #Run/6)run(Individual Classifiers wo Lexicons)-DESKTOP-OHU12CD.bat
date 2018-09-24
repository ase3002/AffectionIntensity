@echo off
color 2

cd ../
SET OUTPUTFILE= "#Results/output_Individual_Classifiers_wo_Lexicons.txt"


echo [Computing anger] 
echo [anger] >> %OUTPUTFILE%

echo Training Models..... & echo.



echo. >> %OUTPUTFILE%
echo [SVM]
echo [SVM] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo [Random Forest]
echo [Random Forest] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -S 1 -W weka.classifiers.trees.RandomForest -- -P 100 -I 100 -num-slots 1 -K 0 -M 1.0 -V 0.001 -S 1 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo [AdditiveRegression/Gradient Boosting]
echo [AdditiveRegression/Gradient Boosting] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -S 1 -W weka.classifiers.meta.AdditiveRegression -- -S 1.0 -I 10 -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%



echo. >> %OUTPUTFILE%
echo [Adaboost]
echo [Adaboost] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -S 1 -W weka.classifiers.meta.RegressionByDiscretization -- -B 10 -K weka.estimators.UnivariateEqualFrequencyHistogramEstimator -W weka.classifiers.meta.AdaBoostM1 -- -P 100 -S 1 -I 10 -W weka.classifiers.trees.J48 -- -C 0.25 -M 2 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%



echo. >> %OUTPUTFILE%
echo [Bagging]
echo [Bagging]>> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -S 1 -W weka.classifiers.meta.Bagging -- -P 100 -S 1 -num-slots 1 -I 10 -W weka.classifiers.trees.REPTree -- -M 2 -V 0.001 -N 3 -S 1 -L -1 -I 0.0 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%



echo. >> %OUTPUTFILE%
echo [Linear Regression]
echo [Linear Regression]>> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\""  -S 1 -W weka.classifiers.functions.LinearRegression -- -S 0 -R 1.0E-8 -num-decimal-places 4 >nul 2>&1

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo All Classifiers completed
rundll32 user32.dll,MessageBeep
pause