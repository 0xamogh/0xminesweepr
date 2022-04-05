const watch = require("node-watch");
const { exec } = require("child_process");

const run = () => {
  console.log("Compiling & Generating...");
  exec("npx gulp css", function (error, stdout, stderr) {
    console.log(stdout);
    if (error) console.log(error);
    if (stderr) console.log(stderr);
  });
};

console.log("🔬 Watching Themes...");
watch("./src/index.css", { recursive: true }, function (evt, name) {
  console.log("%s changed.", name);
  run();
});

run();
