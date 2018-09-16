@echo off
color 2
echo Setting Requiured Configurations and Paths.....  & echo.



REM ###Comments: set path for weka folder and home if necessary### 
setx  WEKA_FOLDER "\"C:\Program Files\Weka-3-8\""
setx  HOME "C:/Users/%USERNAME%"







cd %~dp0/..

python Config/tweets_to_arff.py 1 Data/EI-reg-En-anger-train.txt Arff/EI-reg-En-anger-train.arff >nul

python Config/tweets_to_arff.py 1 Data/2018-EI-reg-En-anger-test.txt Arff/2018-EI-reg-En-anger-test.arff >nul

python Config/tweets_to_arff.py 1 Data/EI-reg-En-fear-train.txt Arff/EI-reg-En-fear-train.arff >nul

python Config/tweets_to_arff.py 1 Data/2018-EI-reg-En-fear-test.txt Arff/2018-EI-reg-En-fear-test.arff >nul

python Config/tweets_to_arff.py 1 Data/EI-reg-En-joy-train.txt Arff/EI-reg-En-joy-train.arff >nul

python Config/tweets_to_arff.py 1 Data/2018-EI-reg-En-joy-test.txt Arff/2018-EI-reg-En-joy-test.arff >nul

python Config/tweets_to_arff.py 1 Data/EI-reg-En-sadness-train.txt Arff/EI-reg-En-sadness-train.arff >nul

python Config/tweets_to_arff.py 1 Data/2018-EI-reg-En-sadness-test.txt Arff/2018-EI-reg-En-sadness-test.arff >nul


echo Configurations set. Proceed to run any of the available scripts in the same folder..... 
rundll32 user32.dll,MessageBeep
pause
