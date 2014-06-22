

export install_dir=$(pwd)
if [ $# -gt 0 ]; then
    install_dir=$1
fi

mkdir -p $install_dir

getScriptPath()
{
    scriptDir=$(dirname $0)
    if [ $scriptDir = "." ]; then
        scriptDir=$(pwd)
    fi
    export scriptFullPath=$scriptDir/$(basename $0)
}

getDataMarker()
{
    export lineNumber=$(grep --text --line-number ^__start_of_data__ $scriptFullPath | tail -n 1 | cut -d : -f 1)
    if [ $? -ne 0 ]; then
        echo "Error: failed to locate installable data. Aborting .."
        exit 1
    fi

    if [ "$lineNumber" = "" ]; then
        echo "Error: no marker for installable data present. Aborting .."
        exit 1
    fi
    lineNumber=$((lineNumber+1))
}


install()
{
    cd $install_dir
    echo "Installing to: $install_dir"
    tail -n +$lineNumber $scriptFullPath | gunzip | tar xvf - 
}


getScriptPath
getDataMarker
install

exit 0

__start_of_data__
