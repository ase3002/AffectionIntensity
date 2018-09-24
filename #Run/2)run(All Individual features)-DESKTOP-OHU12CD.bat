@echo off
color 2

cd ../
SET OUTPUTFILE= "#Results/output_All_Individual_Features.txt"


echo [Computing anger] 
echo [anger] >> %OUTPUTFILE%

echo Training Models..... & echo.



echo. >> %OUTPUTFILE%
echo [SVM w word n grams]
echo [SVM w word n grams] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -E 0 -D 0 -I 0 -F -M 0 -G 0 -taggerFile %HOME%/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -Q 1 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo [SVM w char n grams]
echo [SVM w char n grams] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -A -E 5 -D 3 -I 0 -F -M 2 -G 0 -taggerFile $HOME/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%

echo. >> %OUTPUTFILE%
echo [SVM w stopwords]
echo [SVM w stopwords] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -E 0 -D 0 -I 0 -F -M 0 -G 0 -taggerFile %HOME%/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -Q 1 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Rainbow \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 >nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo [SVM w Word embeddings(Edinburgh Corpus 100d - small collection of tweets)]
echo [SVM w Word embeddings(Edinburgh Corpus 100d - small collection of tweets)] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -E 0 -D 0 -I 0 -F -M 0 -G 0 -taggerFile %HOME%/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -Q 1 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh.100d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%



echo. >> %OUTPUTFILE%
echo [SVM w Word embeddings(Edinburgh Corpus 400d - 10 million tweets)]
echo [SVM w Word embeddings(Edinburgh Corpus 400d - 10 million tweets)] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToSparseFeatureVector -E 0 -D 0 -I 0 -F -M 0 -G 0 -taggerFile %HOME%/wekafiles/packages/AffectiveTweets/resources/model.20120919 -wordClustFile $HOME/wekafiles/packages/AffectiveTweets/resources/50mpaths2.txt.gz -Q 1 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -I 2 -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.TweetToEmbeddingsFeatureVector -I 2 -embeddingHandler \\\"affective.core.CSVEmbeddingHandler -K %HOME%/wekafiles/packages/AffectiveTweets/resources/w2v.twitter.edinburgh10M.400d.csv.gz -sep TAB -I last\\\" -S 0 -K 15 -stemmer weka.core.stemmers.NullStemmer -stopwords-handler \\\"weka.core.stopwords.Null \\\" -U -tokenizer \\\"weka.core.tokenizers.TweetNLPTokenizer \\\"\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000  > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%



echo. >> %OUTPUTFILE%
echo [SVM w Lexicons]
echo [SVM w Lexicons] >> %OUTPUTFILE%

java -XX:+UseConcMarkSweepGC -Xmx4G -cp %WEKA_FOLDER%/weka.jar weka.Run weka.classifiers.meta.FilteredClassifier -t Arff/EI-reg-En-anger-train.arff -T Arff/2018-EI-reg-En-anger-test.arff -classifications "weka.classifiers.evaluation.output.prediction.CSV -use-tab -p first-last -file Output/EI-reg-En-anger-weka-predictions.csv" -F "weka.filters.MultiFilter -F \"weka.filters.unsupervised.attribute.TweetToLexiconFeatureVector -I 2 -A -D -F -H -J -L -N -P -Q -U\" -F \"weka.filters.unsupervised.attribute.TweetToSentiStrengthFeatureVector -I 2 -U\" -F \"weka.filters.unsupervised.attribute.Reorder -R 5-last,4\"" -W weka.classifiers.functions.LibLINEAR -- -S 12 -C 1.0 -E 0.001 -B 1.0 -L 0.1 -I 1000 > nul

python Config/fix_weka_output.py 1 Data/2018-EI-reg-En-anger-test.txt Output/EI-reg-En-anger-weka-predictions.csv Output/EI-reg_en_anger_pred.txt >nul

python Config/evaluate.py 1 Output/EI-reg_en_anger_pred.txt Data/2018-EI-reg-En-anger-test-gold.txt >> %OUTPUTFILE%


echo. >> %OUTPUTFILE%
echo All Combinations completed
rundll32 user32.dll,MessageBeep
pause