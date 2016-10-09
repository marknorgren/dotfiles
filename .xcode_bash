ws() {
    open *.xcworkspace
}

openxc() {
    searchDepth=2
    fileToOpen='';
    for file in `find . -maxdepth $searchDepth -name *.xcworkspace`; do
        fileToOpen=$file
    done

    if [ -n "$fileToOpen" ]
    then
        echo $fileToOpen
        open $fileToOpen
    else
        for file in `find . -maxdepth $searchDepth -name *.xcodeproj`; do
            fileToOpen=$file
        done

        if [ -n "$fileToOpen" ]
        then
            echo $fileToOpen
            open $fileToOpen
        else
            echo "No Xcode projects or workspaces found."
        fi
    fi
}

ox() {
    openxc
}

ddd() {
    #Save the starting dir
    startingDir=$PWD

    #Go to the derivedData
    cd ~/Library/Developer/Xcode/DerivedData

    #Sometimes, 1 file remains, so loop until no files remain
    numRemainingFiles=1
    while [ $numRemainingFiles -gt 0 ]; do
        #Delete the files, recursively
        rm -rf *

        #Update file count
        numRemainingFiles=`ls | wc -l`
    done
    echo Remaining Files: $numRemainingFiles
    echo Done

    #Go back to starting dir
    cd $startingDir
}
