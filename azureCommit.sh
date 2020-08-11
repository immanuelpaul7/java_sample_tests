string=""
x=1
j=50000
while [ $x -le 5000 ]
do
  string="touch jenkins$((j+x)) && git add . && git commit -m jenkins$((j+x)) "
  eval "$string"
  x=$[$x+1]
done

# string+="git push origin master"
echo $string
eval "$string"
