CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

file=`find */ListExamples.java`
if [[ -f $file ]] 
then
    cp -r student-submission/ListExamples.java grading-area
    cp GradeServer.java grading-area
    cp Server.java grading-area
    cp TestListExamples.java grading-area
    cp -r lib/ grading-area
    cd grading-area

    javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
    java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
    if [[ $? == 0 ]]
    then
        echo 'Test Passed'
    else
        echo 'Test Failed'
    fi
    
else
    echo 'This is not done by the provided code, you should figure out where to add it'
    exit 1
fi



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
