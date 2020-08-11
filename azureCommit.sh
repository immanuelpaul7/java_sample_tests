string=""
x=1
j=70000
while [ $x -le 3000 ]
do
  string="touch jenkins$((j+x)) && git add . && git commit -m jenkins$((j+x)) "
  eval "$string"
  x=$[$x+1]
done

string="git push origin tb_1"
echo $string
eval "$string"
