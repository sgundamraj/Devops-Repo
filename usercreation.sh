#!/bin/bash
read -p " please enter the user name:" USERNAME
if [ -z $USERNAME ]; then
    echo " please enter a valid input "
else
    EXUSER=$(cat /etc/passwd | grep -w $USERNAME | cut -d ":" -f 1)
    SPECCHAR=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
    PASSWORD=India@${RANDOM}${SPECHAR}
    if [ "$USERNAME" = "$EXUSER" ]; then
        echo " User $USERNAME exists try different username "
    else
        echo " lets create a user $USERNAME "
        useradd -m ${USERNAME}
        echo ${PASSWORD} | passwd --stdin ${USERNAME}
        passwd -e ${USERNAME}
        echo "Username is ${USERNAME} Password is ${PASSWORD}"
    fi

fi
