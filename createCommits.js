const { spawn } = require("child_process");

var string = "";
for (var i=1000; i< 1002 ; i++) {
  string += " touch jenkins"+i+ " && git add . && git commit -m jenkins"+i + " && " ;
}

string += string + "git push origin master";
console.log(string);
const ls = spawn(string);

ls.stdout.on("data", data => {
    console.log(`stdout: ${data}`);
});

ls.stderr.on("data", data => {
    console.log(`stderr: ${data}`);
});

ls.on('error', (error) => {
    console.log(`error: ${error.message}`);
});

ls.on("close", code => {
    console.log(`child process exited with code ${code}`);
});

const execSync = require('child_process').execSync;
const stdout = execSync('cat jenkins3 | wc -l');
console.log(`stdout: ${stdout}`);
