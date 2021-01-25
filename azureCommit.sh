string=""
x=1
j=70000
while [ $x -le 25 ]
do
  string+="touch jenkins$((j+x)) && git add . && git commit -m jenkins$((j+x)) && "
  x=$[$x+1]
done

string+="git push origin sb_3"
echo $string
eval "$string"
