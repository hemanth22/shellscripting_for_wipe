#!/bin/bash

read -p "Password: " loginpasswd
len=${#loginpasswd}

if test "$len" -ge 8 ; then
    echo "$loginpasswd" | grep -q [0-9]
    if test $? = 0 ; then
        echo "$loginpasswd" | grep -q [A-Z]
        if test $? = 0 ; then
            echo "$loginpasswd" | grep -q [a-z]
            if test $? = 0 ; then
                echo "$loginpasswd" | grep -q [$,@,#,%]
                if test $? = 0 ; then
                    echo "Strong Password"
                else
                    echo "Weak Password: missing special character"
                fi
            else
                echo "Weak Password: missing small letters"
            fi
        else
            echo "Weak Password: missing capital letters"
        fi
    else
        echo "Weak Password: missing numbers"
    fi
else
    echo "Weak Password: Password character length is less than 8 characters"
fi
