#! /bin/bash
echo "This script will download Visual Studio Code, install"
echo "the xcode command line developer tools, and install the"
echo "python packages specified in the arguments."
read -p "Proceed with installation? y/n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing command line tools..."
    xcode-select --install
    echo "Downloading Visual Studio Code..."
    curl -o vscode.zip "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"
    echo "Unzipping VSCode..."
    unzip vscode.zip
    echo "Moving VSCode to your desktop..."
    mv "Visual Studio Code" ~/Desktop
    echo "Installing packages with pip3..."
    for var in "$@"
    do
        pip3 install $var
    done

fi
