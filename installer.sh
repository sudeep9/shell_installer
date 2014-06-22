

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
    echo $lineNumber
    tail -n +$lineNumber $scriptFullPath | gunzip | tar xvf - 
}


getScriptPath
getDataMarker
install

exit 0

__start_of_data__
�ܷ�S tm.tar �SMk�0ݳŰ������z�r
�J	mz,�=�UjKf$w�����G6!	���R�ˠ��{3��.g�cl���쪳,^v�Dq�F�:eI,J�8�Azrf�6�,���#7;{|6�(�����?S]j��Ha}8�v�����G[w�O�2Y���Ә�3`�"t��|��
�^h�y(�A�h@T�"5)�2U.��gF��,}�!�;�"��Zí�[��>�w���3��<�ȱ��ɝ��b�3Z�d�9��j�BC\���pO +G�n�|���u1�9ު/��%%fF(��u�v-�As�������p�B�7*�l�f��U����s��#��V�X�6]��|P��MC�A; '~��
t��\���o4,�]���;�~ë����;�u}������a�eyc=5����3�0a	��LsB�   