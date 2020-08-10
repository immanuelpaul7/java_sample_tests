string=""
x=1
j=2
while [ $x -le 100 ]
do
  string+="touch jenkins$((j+x)) && git add . && git commit -m jenkins$((j+x)) && "
  x=$[$x+1]
done

string+="git push origin master"
echo $string
eval "$string"
