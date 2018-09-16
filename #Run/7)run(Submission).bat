@echo off
color 2

cd ../
SET OUTPUTFILE= "#Results/output_submission.txt"



echo Training Models.....(Submission) & echo.




echo. >> %OUTPUTFILE%
echo [SVM with Word embeddings + Lexicons + Stopwords]
echo [SVM with WE + L + SW] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Rainbow \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-fear-train.arff -T Arff/2018-EI-reg-En-fear-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-fear-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Rainbow \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-fear-test.txt Output/EI-reg-En-fear-weka-predictions.csv Output/EI-reg_en_fear_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_fear_pred.txt Data/2018-EI-reg-En-fear-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-joy-train.arff -T Arff/2018-EI-reg-En-joy-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-joy-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Rainbow \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-joy-test.txt Output/EI-reg-En-joy-weka-predictions.csv Output/EI-reg_en_joy_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_joy_pred.txt Data/2018-EI-reg-En-joy-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-sadness-train.arff -T Arff/2018-EI-reg-En-sadness-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-sadness-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Rainbow \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-sadness-test.txt Output/EI-reg-En-sadness-weka-predictions.csv Output/EI-reg_en_sadness_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_sadness_pred.txt Data/2018-EI-reg-En-sadness-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo All Combinations completed
rundll32 user32.dll,MessageBeep
pause