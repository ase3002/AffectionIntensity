@echo off
color 2

cd ../
SET OUTPUTFILE= "#Results/output_Combination_of_features_and_preprocessors.txt"


echo [Computing anger] 
echo [anger] >> %OUTPUTFILE%

echo Training Models (Combination of features and pre-processors)..... & echo.



echo. >> %OUTPUTFILE%
echo [Word n gram + Char n gram + Word Embbeddings]
echo [WN + CN + WE] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -A -E 5 -D 3 -I 0 -F -M 2 -G 0 -taggerFile $HOME/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -Q 1 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo [Word n gram + Char n gram + Lexicons]
echo [WN + CN + L] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -A -E 5 -D 3 -I 0 -F -M 2 -G 0 -taggerFile $HOME/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -Q 1 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo [Word embeddings + Lexicons]
echo [WE + L] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%



echo. >> %OUTPUTFILE%
echo [Word n gram + Word embeddings + Lexicons]
echo [WN + WE + L] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -E 0 -D 0 -I 0 -F -M 0 -G 0 -taggerFile $HOME/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -Q 1 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo [Word n gram + Char n gram +  Word embeddings + Lexicons]
echo [WN + CN + WE + L] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t  Arff/EI-reg-En-anger-train.arff -T  Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -A -E 5 -D 3 -I 0 -F -M 2 -G 0 -taggerFile %HOME%/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -Q 1 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo [Word embeddings + Lexicons + Stopwords]
echo [WE + L + SW] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Rainbow \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo All Combinations completed
rundll32 user32.dll,MessageBeep
pause