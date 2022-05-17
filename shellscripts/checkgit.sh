#!/bin/sh

git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$? 
# $?
echo $GIT_IS_AVAILABLE
if [ $GIT_IS_AVAILABLE -eq 0 ]; then 
echo "git is installed"
else
echo "git is not installled.Install git from the following url https://git-scm.com/book/en/v2/Getting-Started-Installing-Git"
fi

# | > >> 
# int main(){
# return 2 // failure
# return 1 // failure
# return 0 // Success
# }