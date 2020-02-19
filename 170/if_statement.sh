# !/bin/bash

# 1

string='Hello'

if [[ -n $string ]]
then
  echo $string
fi

# 2

integer_1=10
integer_2=20

if [[ $integer_1 -eq $integer_2 ]]
then
  echo $integer_1 and $integer_2 are the same
fi

if [[ -e ./hello_world.sh ]]
then
  echo 'File exists'
fi

# 3

integer=4

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10

  if [[ $integer -lt 5 ]]
  then
    echo $integer is also less than 5
  fi
fi

# 4

integer=15

if [[ $integer -lt 10 ]]
then 
  echo $integer is less than 10
else
  echo $integer is not less than 10
fi

# 5

integer=15

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10
elif [[ $integer -gt 20 ]]; then
  echo $integer is greater than 20
else
  echo $integer is between 10 and 20
fi

# 6

integer=15

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20
fi

# 7 

integer=7

if ! ([ $integer -eq 5 ]) || ! ([ $integer -eq 6 ])
then 
  echo $integer is not 5 or 6
fi

