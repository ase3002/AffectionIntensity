@echo off
color 2

cd ../
SET OUTPUTFILE= "#Results/output_Individual_Lexicons.txt"


echo [Computing anger] 
echo [anger] >> %OUTPUTFILE%

echo Training Models..... & echo.



echo. >> %OUTPUTFILE%
echo [SVM w Mpqa]
echo [SVM w Mpqa] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w BingLiu]
echo [SVM w BingLiu] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -D\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w Afinn]
echo [SVM w Afinn] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -F\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w Sentiment140]
echo [SVM w Sentiment140] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -H\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w NRC-Hash-Sent]
echo [SVM w NRC-Hash-Sent] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -J\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w NRC10]
echo [SVM w NRC10] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -L\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w NRC-Expanded]
echo [SVM w NRC-Expanded] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -N\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w NRC-Hash-Emo]
echo [SVM w NRC-Hash-Emo] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -P\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w SentiWordNet]
echo [SVM w SentiWordNet] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -Q\"  -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w SentiStrength]
echo [SVM w SentiStrength] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo All Combinations completed
rundll32 user32.dll,MessageBeep
pause