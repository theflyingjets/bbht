#!/bin/bash

#main fun
init(){
    getUsername
    getPassword
    passwordCheck
    encryptPassword
    addsUser
    sudoUser
}

#Ask the user for their name
getUsername(){
    echo "What is the username you want to have?"
    read username
}

#Ask the user for there password twice
getPassword(){
    echo "Please type a password."
    read plaintext1
    echo "Please type a password again."
    read plaintext2
}

#checks if the password was typed in right twice
passwordCheck(){
if [ $plaintext1 = $plaintext2 ]
    then
        echo Here is the username and password.
        echo Username: $username
        echo Passsowrd: $plaintext1
    else
        echo "passwords didn't match try again."
fi
}

#encrypt the password held in plaintext1
encryptPassword(){
    echo encrypting..........
    passwordencrypted=$(perl -e 'print crypt($ARGV[0], "plaintext1")' $plaintext1)
    echo "Here your password encrypted below."
    echo $passwordencrypted
}

#Creates the user and uses encrypted password
addsUser(){
    echo "Adding user"
    sudo useradd -m -p $passwordencrypted $username
    echo "User added"
}

sudoUser(){
    echo "Adding user to sudo gourp"
    sudo usermod -aG sudo $username
    echo "User added to sudo group"
}




#Stays at bottom to start the main fun
init