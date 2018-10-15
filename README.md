# Developing an Affect Intensity Tool by Combining Lexicon and Learning Based Approaches


## Summary
The implementation of sentiment analytical tools is largely centred between the use of lexicons resources and machine learning algorithms that are commonly used for general classification tasks. The results are commonly classified based on its polarities and are being engaged by a wide range of applications in the recent years. This series of experiments provides an insight of a comparison between the two approaches, and is compared with the hybrid approach which is developed. The results are demonstrated on a competition task hosted by the International Workshop on Semantic Evaluation 2018 where the intensity of a different spectrum of emotions is evaluated.


The hybrid model is presented in the experiments and different combinations were considered in various phases of the experiments during the creation of the hybrid model.

Phase 1 - Preprocessing  
Various Nature Language Processing tools such as POS tags, Stemming, Stop-words removal

Phase 2 - Generation of Features  
Features such as word n-gram, word embeddings and various lexicon resources

Phase 3 - Training of Model  
Popular traditional learning algorithms such as LIBLINEAR SVM regression, random forest, boosting methods


## Setup
The Results, Installation Guide and User Manual can be found in the #Documents folder

## Tools used
- WEKA
- LIBLINEAR
- AffectiveTweets 
